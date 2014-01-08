<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.lang.IllegalArgumentException" %>
<%@ page import="java.util.*" %>

<%
	//1. 환경 설정
	Map<String,String> cfgMap = new HashMap<String,String>();

	try {
		// 파라메타 설정
		StringBuffer url = new StringBuffer();
		url.append(request.getScheme()).append("://");
		url.append(request.getServerName());
		if( request.getServerPort() != 80 ) {
			url.append(":").append(request.getServerPort());
		}
		if( !"".equals(request.getContextPath()) ) {
			url.append("/").append(request.getContextPath());
		}
		
        // 프로젝트 키, 레지스트리의 키로 이용된다.
		String key 				= request.getParameter("key");     // [Sample]		
		String runmode 			= request.getParameter("runMode"); // [dev, test, prod]
        String startxml 		= url.toString() + "/ui/" + key + "_start.xml";
		String updatebaseurl	= url.toString() + "/miplatform/3.2win32u";
		
        String shortcut 		= "롯데프레임워크 데모 " + ( runmode.equals("prod") ? "" : runmode );
		String componentpath 	= "%userapp%LOTTE/" + key;
		
        
        /* 아래 설치화면에서 사용할 값들 여기는 변경할 필요없음 */
		cfgMap.put("key", 			key);
		cfgMap.put("runmode", 		runmode);
		cfgMap.put("startxml", 		startxml);
		cfgMap.put("updatebaseurl", updatebaseurl);
		cfgMap.put("shortcut", 		shortcut);
		cfgMap.put("componentpath", componentpath);
		
		cfgMap.put("version", 		"3.2" );
		cfgMap.put("device", 		"win32u" );
		cfgMap.put("codebase", 		"engine_files/MiPlatform_Updater322.cab#VERSION=2009,9,14,1");
		cfgMap.put("clsid", 		"497DAA21-8A86-42c0-AB6C-C7AF046872D2");
		cfgMap.put("pluginpage", 	"engine_files/MiPlatform_Updater322.msi");
		cfgMap.put("width", 		"1280");
		cfgMap.put("height", 		"768" );
		cfgMap.put("retry", 		"0" );
		cfgMap.put("timeout", 		"360");	//초,
		cfgMap.put("onlyone", 		"true");
		cfgMap.put("plugintype", 	"application/mozilla-MiInstaller320-plugin");
		cfgMap.put("resource", 		"%component%resource.xml");
		cfgMap.put("mainicon", 		"%component%mainicon.ico");
		cfgMap.put("startimage", 	"%component%starter.gif");
		cfgMap.put("updateimage", 	"%component%updater.gif");
		
	} catch(IllegalArgumentException e) {
		cfgMap.put("_cfg_err", "true");
		cfgMap.put("_cfg_msg",  e.getMessage());
	} finally {
		// 환경 정보 출력 
		out.print("<!--\n");
		Iterator<String> iter = cfgMap.keySet().iterator();
		while(iter.hasNext()) {
			String name  = (String)iter.next();
			String value = (String)cfgMap.get(name);
			out.print("["+name + "]=[" + value + "]\n");
		}
		out.print("-->");
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>MiPlatform 배포 [<%=cfgMap.get("key")%>]</title>
<link rel="stylesheet" href="./image/style.css" type="text/css">
<script type="text/javascript" src="./install.js"></script> 

<script language="javascript">
var BAR_WIDTH	= 590;		// 진행바 넓이
var vDownBarRt 	= 0;		// 다운로드 진행율
var vDistBarRt	= 0; 		// 설치 진행율
var vErrorFlag  = false;	// 오류 플래그
var vCurrCnt = 0;
var vTotalCnt = 0;

function fnOnLoad()
{
	var MiInstaller = document.getElementById("MiInstaller");

	try {
		MiInstaller.Launch 			= true;
		MiInstaller.Key 			= "<%=cfgMap.get("key")%>";
		MiInstaller.Width  			= <%=cfgMap.get("width")%>;
		MiInstaller.Height 			= <%=cfgMap.get("height")%>;
		MiInstaller.Retry 			= <%=cfgMap.get("retry")%>;
		MiInstaller.Timeout 		= <%=cfgMap.get("timeout")%>;
		MiInstaller.GlobalVal 		= "key=<%=cfgMap.get("key")%>&runmode=<%=cfgMap.get("runmode")%>";
		MiInstaller.OnlyOne 		= <%=cfgMap.get("onlyone")%>;
		MiInstaller.ComponentPath 	= "<%=cfgMap.get("componentpath")%>";
		MiInstaller.StartXml      	= "<%=cfgMap.get("startxml")%>";
		MiInstaller.Resource      	= "<%=cfgMap.get("resource")%>";
		MiInstaller.StartImage    	= "<%=cfgMap.get("startimage")%>";

		var bFixUac = false;
		var osVer = fnDetectWindowsVersion();

		//@REMARK UAC 기능은 Windows Vista(6.0)부터 사용.
		// 아래의 경우에 FixUAC.msi를 설치해야된다.
		if ( osVer >= 6.0) {
			if ( !MiInstaller.IsAdministratorsGroup()) {
				bFixUac = false;
			} else if ( !MiInstaller.IsUACEnabled() ) { 		// uac off
				bFixUac = true;
			} else	if ( MiInstaller.IsElevatedProcess() ) {	// uac on && 관리자 권한 상속
				bFixUac = true;
			}
		}
		
		//@REMARK windows 버젼 및 bFixUac에 따라서 UPDATEURL을 설정한다.
		// 5.0 : windows 2000
		var updateUrl = "<%=cfgMap.get("updatebaseurl")%>";
		if( osVer < 0) {
			alert("지원하지 않는 윈도우 버젼입니다.");
			return;
		} else 	if( osVer < 5.0 ) {
			// Windows 2000 미만인 경우 (Windows 98)
			// cab 방식으로 엔진 설치
			MiInstaller.UpdateURL = updateUrl + "/update_cab.xml";
		} else {
			// Windows 2000 이상.
			if( bFixUac ) {
				// update_msi_uac.xml
				MiInstaller.UpdateURL = updateUrl + "/update_msi_uac.xml";
			} else {
				// update_msi.xml
				MiInstaller.UpdateURL = updateUrl + "/update_msi.xml";
			}
		}

		var upCnt = MiInstaller.ExistVersionUpCnt(); 
		if ( upCnt ){
			MiInstaller.StartDownload();
		} else {
			fnRun();
		}
	} catch(ex) {}
	
}

/**
 * @REMARK 320/321/322 버젼에 따라서 MakeShortCut의 파라메타가 다르다...
 */
function fnMakeShortCut()
{
	var MiInstaller = document.getElementById("MiInstaller");
	
	//@REMARK 바탕화면 아이콘, 업데이트 splash 이미지 변경
	var strCommand = '-V <%=cfgMap.get("version")%> -D <%=cfgMap.get("device")%> -R FALSE -K <%=cfgMap.get("key")%> -L TRUE -LE TRUE -BI "<%=cfgMap.get("updateimage")%>" ';
	//MiInstaller.MakeShortCut("%system%MiUpdater321.exe", strCommand, "<%=cfgMap.get("shortcut")%>", "<%=cfgMap.get("mainicon")%>", "");
	MiInstaller.MakeShortCut("MU", strCommand, "<%=cfgMap.get("shortcut")%>", "<%=cfgMap.get("mainicon")%>", "");
} 

function fnRun()
{
	var MiInstaller = document.getElementById("MiInstaller");
	
	//설치 오류 플래그
	if ( vErrorFlag ) {
		return ;
	}

	<%if( cfgMap.get("shortcut").length() > 0) { %>
	fnMakeShortCut();
	<%}%> 
	
	// 마이플랫폼 실행
	MiInstaller.run();
	window.close();
}

function fnUpdateProgress(obj, cur_cnt) {
	if ( obj.id == "down_bar" ) {
		obj.width = cur_cnt;
	} else {
		obj.width = cur_cnt;
	}
}
</SCRIPT>

<SCRIPT language=JavaScript for=MiInstaller event=OnConfirm(ItemName)>
{
	var a;
	a  = "OnConfirm=>Item=";
	a += ItemName;	
}
</SCRIPT>

<SCRIPT LANGUAGE=javascript FOR=MiInstaller
	EVENT=OnProgress(ItemName,prgress,progressMax,StatusText)>
{
	if(ItemName != "")	{
		if( progressMax > 0 && prgress > 0 )	{
			vDownBarRt = parseInt( ( ( ( vCurrCnt - 1)/vTotalCnt ) * BAR_WIDTH ) +  ( ( ( 1/vTotalCnt ) * BAR_WIDTH ) * (prgress/progressMax) ) );
		    if ( vDownBarRt > BAR_WIDTH ) vDownBarRt = BAR_WIDTH;
		    down_bar.width = vDownBarRt;
		}
	}
}
</SCRIPT>

<SCRIPT language=JavaScript for=MiInstaller
	event=OnStartDownLoad(VersionFileName,DownFileName,Type,TotalCnt,CurIndex)>
{
	if ( Type == 1 ) { //EVENTCONFIG
		;
	} else if ( Type == 2 ) {
		down_bar.width = 0;
		inst_bar.width = 0;
		tot_item.innerHTML = "&nbsp;" + CurIndex + "/" + TotalCnt;		
	} else if ( Type == 3 ) { //EVENTDOWNLOAD
		vCurrCnt = CurIndex;
		vTotalCnt = TotalCnt;
		tot_item.innerHTML = "&nbsp;" + CurIndex + "/" + TotalCnt;		
			
		var tpos = DownFileName.lastIndexOf("/") + 1;
		var Fname = DownFileName.substr(tpos,DownFileName.length - tpos);

		prc_file.innerHTML = "&nbsp;" + Fname;
		
		if ( prc_msg != "" && prc_msg != null && prc_msg != "undefined" ) prc_msg.innerHTML = "&nbsp;파일 다운로드 중....";
	} else if ( Type == 4 ) { //EVENTDISTRIBUTE
		var tpos = DownFileName.lastIndexOf("/") + 1;
		var Fname = DownFileName.substr(tpos,DownFileName.length - tpos);
		prc_file.innerHTML = "&nbsp;" + Fname;
		if ( prc_msg != "" && prc_msg != null && prc_msg != "undefined" ) prc_msg.innerHTML = "&nbsp;실제 경로 배포 중....";
	}	
}
</SCRIPT>

<SCRIPT language=JavaScript for=MiInstaller
	event=OnEndDownLoad(VersionFileName,DownFileName,Type,TotalCnt,CurIndex)>
{
	if ( Type == 1 ) { //EVENTCONFIG
		if ( !vErrorFlag ) {
			fnUpdateProgress(down_bar, BAR_WIDTH);
			fnUpdateProgress(inst_bar, BAR_WIDTH);
			if ( prc_msg != "" && prc_msg != null && prc_msg != "undefined" ) prc_msg.innerHTML = "&nbsp;설치 완료";
			
			fnRun();
			//history.back();
		}	
	} else if ( Type == 3 ) { //EVENTDOWNLOAD
	    vDownBarRt = parseInt( ( (CurIndex)/TotalCnt ) * BAR_WIDTH );
        fnUpdateProgress(down_bar, vDownBarRt);
		
		if ( vErrorFlag ) {
			tbl_err.className = "show";
			reinstall.className = "show";
		}		
	
		if ( prc_msg != "" && prc_msg != null && prc_msg != "undefined" ) prc_msg.innerHTML = "&nbsp;파일 다운로드 완료....";
	} else if ( Type == 4 ) { //EVENTDISTRIBUTE
		vDistBarRt = parseInt( ( (CurIndex)/TotalCnt ) * BAR_WIDTH );
        fnUpdateProgress(inst_bar, vDistBarRt);
		if ( vErrorFlag ) {
			tbl_err.className = "show";
			reinstall.className = "show";
		}		
		
		if ( prc_msg != "" && prc_msg != null && prc_msg != "undefined" ) prc_msg.innerHTML = "&nbsp;실제 경로 배포 완료";
	}
}
</SCRIPT>
<SCRIPT language=JavaScript for=MiInstaller event=OnError(ItemName,ErrorCode,ErrorMsg)>
{
	var MiInstaller = document.getElementById("MiInstaller");
	
	vErrorFlag = true;
	err_msg.innerHTML += '<font class="f2" color="red">' + ItemName + '&nbsp;다운&nbsp;실패&nbsp; -- ErrorCode:' + ErrorCode + ' ' + ErrorMsg + "<br>";
	tbl_err.className = "show";
	reinstall.className = "show";
	MiInstaller.stop();
}
</SCRIPT>

</head>
<BODY leftmargin="0" topmargin="0" onload="fnOnLoad()">
<br>
<br>
<center>
<table align="center" border=0 width="600">
	<tr>
		<td>
		<table width="637" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="10"></td>
			</tr>
			<tr>
				<td><img src="image/insu_down_listbg1.gif" width="637" height="11"></td>
			</tr>
			<tr>
				<td height="37" bgcolor="#EEEEEE">
				<table width="607" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td height="15"></td>
					</tr>
					<tr>
						<td>
						<table width="590" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td width="10" rowspan="3"><img src="image/insu_down_img.gif" width="150" height="90"></td>
								<td width="590" height="35"><img src="image/insu_down_title.gif" width="204" height="27"></td>
							</tr>
							<tr>
								<td height="45"><img src="image/insu_down_title2.gif" width="329" height="32"></td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
						<table width="607" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="12" height="12"><img	src="image/insu_down_listbg_sub1.gif" width="12" height="12"></td>
								<td width="583" height="12" bgcolor="#FFFFFF"></td>
								<td width="12" height="12"><img src="image/insu_down_listbg_sub2.gif" width="12" height="12"></td>
							</tr>
							<tr>
								<td rowspan="5" bgcolor="#FFFFFF">&nbsp;</td>
								<td bgcolor="#FFFFFF">
								<table width="570" border="0" align="center" cellpadding="0"
									cellspacing="0">
									<tr>
										<td width="10" valign="top">
											<img src="image/insu_down_list_icon1.gif" width="8" height="11">
										</td>
										<td width="570">
											암호화 프로그램 설치여부를 묻는 보안경고창이 나타나면 반드시 “<strong>
											<font color="#FF7200">예</font></strong>”를 선택하여주시기 바랍니다.<br>
										“아니오”를 선택하시면 보안을 위해 사용이 제한됩니다.</td>
									</tr>
								</table>
								</td>
								<td rowspan="5" bgcolor="#FFFFFF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF">
								<table width="570" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td width="10" valign="top"><img src="image/insu_down_list_icon1.gif" width="8" height="11"></td>
										<td width="570">
											윈도우 XP 서비스팩2 사용자께서는 주소 표시줄 아래 경고문구 “ 
											<img src="image/insu_down_list_icon2.gif" width="15" height="15" align="absmiddle">
											이 사이트에서...여기를 클릭하십<br>
										시오” 를 선택하시어, Active X컨트롤을 설치하시기 바랍니다.</td>
									</tr>
								</table>
								</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF">
								<table width="570" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td width="10" valign="top"><img src="image/insu_down_list_icon1.gif" width="8" height="11"></td>
										<td width="570">
											프로그램 설치가 정상적이지 않을 경우에는 
											<!-- @REMARK Updater EXE로 설치하기 -->
											<a href="<%=cfgMap.get("updatebaseurl")%>/<%=cfgMap.get("pluginpage")%>"><strong>
											<font color="#FF7200">수동설치</font></strong></a> 를 통해 수동설치하시거나 <strong>
											<font color="#FF7200">문의하기</font></strong>를 통해 질문<br>
											하시면 신속히 답변을 드리겠습니다.
										</td>
									</tr>
								</table>
								</td>
							</tr>
							<tr>
								<td width="12" height="12"><img	src="image/insu_down_listbg_sub3.gif" width="12" height="12"></td>
								<td bgcolor="#FFFFFF"></td>
								<td width="12" height="12"><img src="image/insu_down_listbg_sub4.gif" width="12" height="12"></td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td><img src="image/insu_down_listbg2.gif" width="637" height="11"></td>
			</tr>
			<tr>
				<td height="5"></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</center>
<table align="center" border=0 width="600">
	<tr>
		<td>
		<table>
			<tr>
				<td class="f2">파일다운로드 진행 상황</td>
				<td class="f2" align=left NOWRAP>&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td colspan=2 valign="middle" WIDTH=590>
		<div valign="middle"
			style="font-size: 3px; padding: 1px; border: 1px GROOVE silver;">
		<IMG ID="down_bar" SRC='image/installbar.jpg' WIDTH=0% HEIGHT=10>
		</div>
		<!--
	<div id=pg style="font-size:4px;padding:1px;border:1px GROOVE silver;" >
		<span id="down_bar" >&nbsp;</span>
	</div>
	--></td>
	</tr>
	<tr>
		<td>
		<table>
			<tr>
				<td class="f2">파일설치 진행 상황</td>
				<td id="tot_item" align=left class="f2" NOWRAP>&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td colspan=2 valign="middle" WIDTH=590>
			<div style="font-size: 3px; padding: 1px; border: 1px GROOVE silver;">
			<IMG ID="inst_bar" SRC='image/installbar.jpg' WIDTH=0% HEIGHT=10>
			</div>
<!--
	<div id=pg1 style="font-size:4px;padding:1px;border:1px GROOVE silver;">
		<span id="inst_bar" >&nbsp;</span>
	</div>
-->
		</td>
	</tr>
	<tr>
		<td>
		<table>
			<tr>
				<td class="f2">대상파일</td>
				<td id="prc_file" class="f2" align=left NOWRAP>&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td id=prc_msg class="f2">&nbsp;
		<td>
	</tr>
</table>
<table class="hide" id=tbl_err align=center>
	<tr>
		<td class="f2">설치시 에러가 발생한 항목</td>
	</tr>
	<tr>
		<td id=err_msg class="f2">&nbsp;</td>
	</tr>
</table>

<script>
fnCreateInstaller("MiInstaller"
		, "<%=cfgMap.get("device")%>"
		, "<%=cfgMap.get("version")%>"
		, "<%=cfgMap.get("key")%>"
		, "<%=cfgMap.get("clsid")%>"
		, "<%=cfgMap.get("updatebaseurl")%>/<%=cfgMap.get("codebase")%>"
		, "<%=cfgMap.get("plugintype")%>"
		, "<%=cfgMap.get("updatebaseurl")%>/<%=cfgMap.get("pluginpage")%>"
		);
</script>
</BODY>
</HTML>



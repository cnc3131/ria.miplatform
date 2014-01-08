// -------------------------------------------------------------------
// 원본 : http://www.quirksmode.org/js/detect.html
// -------------------------------------------------------------------
var BrowserDetect = {
	init: function () {
		this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
		this.version = this.searchVersion(navigator.userAgent)
			|| this.searchVersion(navigator.appVersion)
			|| "an unknown version";
		this.OS = this.searchString(this.dataOS) || "an unknown OS";
	},
	searchString: function (data) {
		for (var i=0;i<data.length;i++)	{
			var dataString = data[i].string;
			var dataProp = data[i].prop;
			this.versionSearchString = data[i].versionSearch || data[i].identity;
			if (dataString) {
				if (dataString.indexOf(data[i].subString) != -1)
					return data[i].identity;
			}
			else if (dataProp)
				return data[i].identity;
		}
	},
	searchVersion: function (dataString) {
		var index = dataString.indexOf(this.versionSearchString);
		if (index == -1) return;
		return parseFloat(dataString.substring(index+this.versionSearchString.length+1));
	},
	dataBrowser: [
		{
			string: navigator.userAgent,
			subString: "Chrome",
			identity: "Chrome"
		},
		{ 	string: navigator.userAgent,
			subString: "OmniWeb",
			versionSearch: "OmniWeb/",
			identity: "OmniWeb"
		},
		{
			string: navigator.vendor,
			subString: "Apple",
			identity: "Safari",
			versionSearch: "Version"
		},
		{
			prop: window.opera,
			identity: "Opera"
		},
		{
			string: navigator.vendor,
			subString: "iCab",
			identity: "iCab"
		},
		{
			string: navigator.vendor,
			subString: "KDE",
			identity: "Konqueror"
		},
		{
			string: navigator.userAgent,
			subString: "Firefox",
			identity: "Firefox"
		},
		{
			string: navigator.vendor,
			subString: "Camino",
			identity: "Camino"
		},
		{		// for newer Netscapes (6+)
			string: navigator.userAgent,
			subString: "Netscape",
			identity: "Netscape"
		},
		{
			string: navigator.userAgent,
			subString: "MSIE",
			identity: "Explorer",
			versionSearch: "MSIE"
		},
		{
			string: navigator.userAgent,
			subString: "Gecko",
			identity: "Mozilla",
			versionSearch: "rv"
		},
		{ 		// for older Netscapes (4-)
			string: navigator.userAgent,
			subString: "Mozilla",
			identity: "Netscape",
			versionSearch: "Mozilla"
		}
	],
	dataOS : [
		{
			string: navigator.platform,
			subString: "Win",
			identity: "Windows"
		},
		{
			string: navigator.platform,
			subString: "Mac",
			identity: "Mac"
		},
		{
			   string: navigator.userAgent,
			   subString: "iPhone",
			   identity: "iPhone/iPod"
	    },
		{
			string: navigator.platform,
			subString: "Linux",
			identity: "Linux"
		}
	]

};
BrowserDetect.init();

//-------------------------------------------------------------------
//원본 : http://www.quirksmode.org/js/detect.html
//-------------------------------------------------------------------

/**
 * Microsoft Windows 버젼을 리턴한다.
 * 
 * @return 0   : 마이플랫폼이 지원하지 않는 윈도우인 경우
 *         > 0 : 마이플랫폼이 지원하는 윈도우인 경우
 */
function fnDetectWindowsVersion()
{
	var osVer = 0;
	
	var useragent = navigator.userAgent;
	if( useragent.indexOf("Windows NT 6.1") > -1) {
		//"Windows 7";
		osVer = 6.1;
	} else if( useragent.indexOf("Windows NT 6.0") > -1) {
		//"Windows Vista";
		osVer = 6.0;
	} else if( useragent.indexOf("Windows NT 5.2") > -1) {
		//"Windows Server 2003; Windows XP x64 Edition";
		osVer = 5.2;
	} else if( useragent.indexOf("Windows NT 5.1") > -1) {
		//"Windows XP";
		osVer = 5.1;
	} else if( useragent.indexOf("Windows NT 5.01") > -1) {
		//"Windows 2000 SP1";
		osVer = 5.01;
	} else if( useragent.indexOf("Windows NT 5.0") > -1) {
		//"Windows 2000";
		osVer = 5.0;
	} else if( useragent.indexOf("Windows 98; Win 9x 4.90") > -1 ) {
		//Windows Millennium Edition (Windows Me)
		osVer = 4.1;
	} else if( useragent.indexOf("Windows 98") > -1 ) {
		//Windows 98
		osVer = 4.0;
	} else if( useragent.indexOf("Windows 95") > -1 ) {
		//Windows 95
		osVer = 0;
	} else if( useragent.indexOf("Windows CE") > -1 ) {
		//Windows CE
		osVer = 0;
	} else {
		osVer = 0;
	}
	return osVer;
}

/**
 * 브라우져가 ActiveX 지원 여부 검사
 * 	Explorer, 8
 *	Chrome, 3
 *	Firefox, 3.5
 *	Safari, 4
 *	Opera, 9.8
 * @return boolean 
 */
function fnIsSupportedActiveX()
{
	var name    = BrowserDetect.browser.toLowerCase();
	var version = BrowserDetect.version;
	
	if( name == "explorer") {
		return true;
	} else {
		return false;
	}
}

/**
 * 브라우져가 NPAPI(Netscape Plugin Application Programming Interface) 지원 여부 검사
 * 
 * IE 7.0 이상
 * Firefox 2.0.0 이상
 * Chrome 1.0.154.48 이상
 * Flock 2.0.3 이상
 * Safari 3.2.1 (525.27.1) 이상
 * Opera 9.64 이상 
 * 
 * @return boolean
 */
function fnIsSupportedPlugin()
{
	var name    = BrowserDetect.browser.toLowerCase();
	var version = BrowserDetect.version;
	
	if( name == "explorer") {
		return false;
	} else {
		// 버젼 체크 필요
		return true;
	}
}

/**
 * 
 * @param objId      Object Id                     [e.g, "MiInstaller"]
 * @param deviceType MiInstaller Device            [e.g, "win32", "win32u"]
 * @param version    MiInstaller Version           [e.g, "3.2"]
 * @param projectKey Project Key                   [e.g, "KMS"]
 * @param clsid      Active-Classid [e.g, "497DAA21-8A86-42c0-AB6C-C7AF046872D2"]
 * @param codebase   Codebase-url or Plugin-url    [e.g, "./320U/MiPlatform_Updater322.cab#VERSION=2009,6,3,1"]
 * @param pluginstype Plugin-type [e.g, "application/mozilla-MiPlatformX330U-plugin"]
 * @param pluginspage Plugin-url  [e.g, "./320U/MiPlatform_Updater322.cab#VERSION=2009,6,3,1"]
 */
function fnCreateInstaller(objId, deviceType, version, projectKey, clsid, codebase, pluginstype, pluginspage)
{
	var str = "";
	if( fnIsSupportedActiveX() ) {
		str += '<object id="' + objId + '"';
		str += ' classid="clsid:' + clsid + '"';
		str += ' width="0"';
		str += ' height="0"';
		str += ' codebase="' + codebase + '"';
		str += ' SHOWASTEXT>\n';
		str += '<param name="DeviceType" value="' + deviceType + '">\n';
		str += '<param name="Version" value="' + version + '">\n';
		str += '<param name="Key" value="' + projectKey + '">\n';
		str += '</object>';
	} else if( fnIsSupportedPlugin() ) {
		str += '<embed id="' + objId + '"';
		str += 'type="' + pluginstype + '"';
		str += 'width="0" ';
		str += 'height="0" ';
		str += 'pluginspage="' + pluginspage + '"';
		str += '>';
		str += '<param name="DeviceType" value="' + deviceType + '">\n';
		str += '<param name="Version" value="' + version + '">\n';
		str += '<param name="Key" value="' + projectKey + '">\n';
		str += '</embed>';
	} else {
		return;
	}
	document.write(str);
}



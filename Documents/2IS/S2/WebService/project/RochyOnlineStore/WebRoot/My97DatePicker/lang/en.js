var $lang = {
	errAlertMsg:   parent.getLocaleMessage("my97.errAlertMsg"),
	aWeekStr:      parent.getLocaleMessage("my97.aWeekStr"),
	aLongWeekStr:  parent.getLocaleMessage("my97.aLongWeekStr"),
	aMonStr:       parent.getLocaleMessage("my97.aMonStr"),
	aLongMonStr:   parent.getLocaleMessage("my97.aLongMonStr"),
	clearStr:      parent.getLocaleMessage("my97.clearStr"),
	todayStr:      parent.getLocaleMessage("my97.todayStr"),
	okStr:         parent.getLocaleMessage("my97.okStr"),
	updateStr:     parent.getLocaleMessage("my97.updateStr"),
	timeStr:       parent.getLocaleMessage("my97.timeStr"),
	quickStr:      parent.getLocaleMessage("my97.quickStr"),
	err_1:         parent.getLocaleMessage("my97.err_1")
};

function _loadCssFile(cssFile) {
	var cssFileImport = document.createElement("link");
	cssFileImport.setAttribute("rel", "stylesheet");
	cssFileImport.setAttribute("type","text/css");
	cssFileImport.setAttribute("href", cssFile);
	document.getElementsByTagName("head")[0].appendChild(cssFileImport);
}

_loadCssFile("include/skin/i18n/" + parent._getLocaleLang() + ".css");
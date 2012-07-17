/**
 * plaxo
 */
function showPlaxo(){
	showPlaxoABChooser('txtAddresses', '/plaxo.html'); 
	return false;
}
function emptyPlaxo(){
	document.forms["form1"].txtAddresses.value = "";
}
function onABCommComplete() {
	if (console) {
		console.info(document.forms["form1"].txtAddresses.value);
	}
	flapp.plaxoCallBack(document.forms["form1"].txtAddresses.value);
  // OPTIONAL: do something here after the new data has been populated in your text area
}
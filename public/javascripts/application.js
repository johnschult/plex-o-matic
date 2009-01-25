$(document).ready(function(){

  function clearInput() {
    $("#input").val('');
    $("#input").focus();
  }
  
  function formatItem(row) {
    // title, one-liner, year, length, rating, genre
    html = "<b>" + row[0] + "</b>";
    html += "<img src='" + row[3] + "' /><br/>"
    html += "<span>" + row[1] + " ● " + row[4]
    if (row[2]) html +=" ● " + row[2]
    html += "</span>";
  	return html;
  }

  $(document).keyup(function(event){
    if (event.keyCode == 27) {
      clearInput();
    }
  });

	var ac = $("#input").autocomplete(
		"/media/search",
		{
			minChars:1,
			matchSubset:0,
			matchContains:1,
			maxItemsToShow:10,
			cacheLength:1,
			onItemSelect:clearInput,
			onFindValue:clearInput,
			formatItem:formatItem,
			width:458
		}
	);

  $("#input").focus();
	
});
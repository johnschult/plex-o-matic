$(document).ready(function(){

  function clearInput() {
    $("#input").val('');
    $("#input").focus();
  }
  
  function formatItem(row) {
    // title, one-liner, year, length, rating, genre
    html = "<b>" + row[0] + "</b>";
    html += "<img src='" + row[3] + "' />"
    html += "<br/><span>" + row[1] + " ● " + row[4] + " ● " + row[2] + "</span>";
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
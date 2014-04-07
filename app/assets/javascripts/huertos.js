
$(document).ready(function(){
	
	$("#s3-uploader01").S3Uploader();
	$("#s3-uploader02").S3Uploader();
	$("#s3-uploader03").S3Uploader();
	

	$('#s3-uploader01').bind('s3_uploads_complete', function(e, content){
	  $('#huerto_foto01').val(content.url) 
	  document.getElementById('spanfile01').innerHTML=content.filename	  
	  document.getElementById('img01').src=content.url;
	  document.getElementById('img011').src=content.url;
	  
	});


	$('#s3-uploader02').bind('s3_uploads_complete', function(e, content){
	  $('#huerto_foto02').val(content.url) 
	  document.getElementById('spanfile02').innerHTML=content.filename
	  document.getElementById('img02').src=content.url;
	  document.getElementById('img022').src=content.url;
	  
	});
	

	$('#s3-uploader03').bind('s3_uploads_complete', function(e, content){
	  $('#huerto_foto03').val(content.url) 
	  document.getElementById('spanfile03').innerHTML=content.filename
	  document.getElementById('img03').src=content.url;
	  document.getElementById('img033').src=content.url;
	});	
	
  // call the tablesorter plugin
  $("#myTable").tablesorter({
    theme: 'blue',

    // hidden filter input/selects will resize the columns, so try to minimize the change
    widthFixed : true,

    // initialize zebra striping and filter widgets
    widgets: ["filter"],

    // headers: { 5: { sorter: false, filter: false } },

    widgetOptions : {

      // If there are child rows in the table (rows with class name from "cssChildRow" option)
      // and this option is true and a match is found anywhere in the child row, then it will make that row
      // visible; default is false
      filter_childRows : false,

      // if true, a filter will be added to the top of each table column;
      // disabled by using -> headers: { 1: { filter: false } } OR add class="filter-false"
      // if you set this to false, make sure you perform a search using the second method below
      filter_columnFilters : true,

      // extra css class applied to the table row containing the filters & the inputs within that row
      filter_cssFilter : '',

      // class added to filtered rows (rows that are not showing); needed by pager plugin
      filter_filteredRow   : 'filtered',

      // add custom filter elements to the filter row
      // see the filter formatter demos for more specifics
      filter_formatter : null,

      // add custom filter functions using this option
      // see the filter widget custom demo for more specifics on how to use this option
      filter_functions : null,

      // if true, filters are collapsed initially, but can be revealed by hovering over the grey bar immediately
      // below the header row. Additionally, tabbing through the document will open the filter row when an input gets focus
      filter_hideFilters : true,

      // Set this option to false to make the searches case sensitive
      filter_ignoreCase : true,

      // if true, search column content while the user types (with a delay)
      filter_liveSearch : true,

      // jQuery selector string of an element used to reset the filters
      filter_reset : 'button.reset',

      // Use the $.tablesorter.storage utility to save the most recent filters (default setting is false)
      filter_saveFilters : true,

      // Delay in milliseconds before the filter widget starts searching; This option prevents searching for
      // every character while typing and should make searching large tables faster.
      filter_searchDelay : 300,

      // if true, server-side filtering should be performed because client-side filtering will be disabled, but
      // the ui and events will still be used.
      filter_serversideFiltering: false,

      // Set this option to true to use the filter to find text from the start of the column
      // So typing in "a" will find "albert" but not "frank", both have a's; default is false
      filter_startsWith : false,

      // Filter using parsed content for ALL columns
      // be careful on using this on date columns as the date is parsed and stored as time in seconds
      filter_useParsedData : false

    }

  });
	 
	 

});


 



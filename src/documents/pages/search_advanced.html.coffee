### coffee
layout: 'default'
title: 'Advanced Search'
pageOrder: 6
dynamic: true
###

if @req.query.query
	query = @req.query.query

	h2 "Result for #{query}"

	ul ->
	for document in @getCollection('documents').findAll({title:$like:query}).toJSON()
	    li 'typeof': 'sioc:Page', about: document.url, class: ('active'  if @document.url is document.url), ->
		a href: @getUrl(document.url), property: 'dc:title', ->
		    text document.title

else
	h2 "Advanced Search"

	form action:'', method:'GET', ->
		section ->
		 	label 'All fields'
		 	input type:'text', name:'query', value:(query or '')
		section ->
		 	label 'Keywords'
		 	input type:'text', name:'keywords', value:(query or '')
		section ->
		 	label 'Contact'
		 	input type:'text', name:'contact', value:(query or '')
		section ->
		 	label 'Technologies'
		 	input type:'text', name:'tech', value:(query or '')
		section ->
		 	label 'Homepage'
		 	input type:'text', name:'homepage', value:(query or '')
		section ->
		 	label 'License'
		 	input type:'text', name:'license', value:(query or '')
		section ->
		 	label 'Category'
		 	input type:'text', name:'category', value:(query or '')

			input type:'submit', value:'Search', ->		

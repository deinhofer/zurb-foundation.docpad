### coffee
layout: 'default'
title: 'Search'
pageOrder: 4
includenInNavs: ['main']
navtitle: 'Search'
dynamic: true
###

if @req.query.query
	query = @req.query.query

	h2 "Result for #{query}"

	ul ->
	for document in @getCollection('documents').findAll({title:$like:query}).toJSON()
	    li 'typeof': 'sioc:Page', about: document.url, class: ('active'  if @document.url is document.url), ->
		a href: document.url, property: 'dc:title', ->
		    text document.title

else
	h2 "Search for components"
	a href: './search_advanced', property: 'dc:title', ->
	    text 'Advanced Search'

	form action:'', method:'GET', ->

		input type:'text', name:'query', value:(query or ''), ->	

		input type:'submit', value:'Search', ->

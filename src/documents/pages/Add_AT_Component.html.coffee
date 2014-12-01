### coffee
layout: 'default'
title: 'Add Component'
pageOrder: 5
includenInNavs: ['main']
navtitle: 'Add Component'
dynamic: false
###

h2 "Add Component"

form action:'', method:'GET', ->
	section ->
	 	label 'Description'
	 	input type:'text', name:'description'
	section ->
	 	label 'Keywords'
	 	input type:'text', name:'keywords'
	section ->
	 	label 'Contact'
	 	input type:'text', name:'contact'
	section ->
	 	label 'Technologies'
	 	input type:'text', name:'tech'
	section ->
	 	label 'Homepage'
	 	input type:'text', name:'homepage'
	section ->
	 	label 'License'
	 	input type:'text', name:'license'
	section ->
	 	label 'Category'
	 	input type:'text', name:'category'

		input type:'submit', value:'Add Component', ->

<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Komunumo"/></title>
        <meta name="description" content="">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
        
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">

        <!-- build:js scripts/vendor/modernizr.js -->
        <script src="app/bower_components/modernizr/modernizr.js"></script>
        <!-- endbuild -->
        
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body data-view="${dataView}">
        <g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>

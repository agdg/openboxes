<html>
<head>
	<meta name="layout" content="custom" />
	<g:layoutHead />
    <script src="${createLinkTo(dir:'js/knockout/', file:'knockout-2.2.0.js')}" type="text/javascript" ></script>
    <script src="${createLinkTo(dir:'js/', file:'knockout_binding.js')}" type="text/javascript" ></script>    
    <script src="${createLinkTo(dir:'js/', file:'inventory.js')}" type="text/javascript" ></script>
    <script src="${createLinkTo(dir:'js/jquery.cycle', file:'jquery.cycle.lite.js')}" type="text/javascript" ></script>
    <script src="${createLinkTo(dir:'js/jquery.nailthumb', file:'jquery.nailthumb.1.1.js')}" type="text/javascript" ></script>
	<title><g:pageProperty name="page.title"/></title>
<%--
    <gvisualization:apiImport/>
--%>
</head>
<body>
	<div class="body">	
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if> 
		
		<g:hasErrors bean="${commandInstance}">
			<div class="errors">
				<g:renderErrors bean="${commandInstance}" as="list" />
			</div>
		</g:hasErrors>

		<g:hasErrors bean="${flash.errors}">
			<div class="errors">
				<g:renderErrors bean="${flash.errors}" as="list" />
			</div>
		</g:hasErrors>
		
		<g:render template="../product/summary" model="[productInstance:commandInstance?.productInstance,
			inventoryInstance:commandInstance?.inventoryInstance,
			inventoryLevelInstance: commandInstance?.inventoryLevelInstance,
			totalQuantity: commandInstance?.totalQuantity]"/>

		<div class="dialog">		
            <div class="yui-gf">
                <div class="yui-u first">
                    <g:render template="productDetails"
                        model="[productInstance:commandInstance?.productInstance,
                            inventoryInstance:commandInstance?.inventoryInstance,
                            inventoryLevelInstance: commandInstance?.inventoryLevelInstance,
                            totalQuantity: commandInstance?.totalQuantity]"/>
                </div>
                <div class="yui-u">
                    <g:pageProperty name="page.content"/>
                </div>
            </div>
        </div>
	</div>
	<script>
		$(document).ready(function() {

			$('.nailthumb-container img').nailthumb({width : 60, height : 60});
			
			$(".tabs").tabs({
				cookie : {
					expires : 1
				},
                ajaxOptions: {
                    error: function(xhr, status, index, anchor) {
                        $(anchor.hash).html();
                    },
                    beforeSend: function() {
                        $('#loader').show();
                    },
                    complete: function() {
                        $("#loader").hide();
                    }
                }
			});
		});


		
	</script>

</body>
</html>
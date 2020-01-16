<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="스마트메뉴를 사용하기 위한 코드" 
    %>
<!-- SmartMenus core CSS 시작 (required) -->
 <link href="http://211.63.89.150:8080/spring_mvc_temp/common/smart_menu/css/sm-core-css.css" rel="stylesheet" type="text/css" />
 <!-- "sm-blue" menu theme (optional, you can use your own CSS, too) -->
 <link href="http://211.63.89.150:8080/spring_mvc_temp/common/smart_menu/css/sm-simple/sm-simple.css" rel="stylesheet" type="text/css" />
 <!-- SmartMenus core CSS 끝 -->
    <!-- SmartMenus 시작 -->
    <script type="text/javascript" src="http://211.63.89.150:8080/spring_mvc_temp/common/smart_menu/jquery.smartmenus.min.js"></script>
    <script type="text/javascript">
    	$(function() {
    		$('#main-menu').smartmenus({
    			subMenusSubOffsetX: 1,
    			subMenusSubOffsetY: -8
    		});
    	});

    </script>
    <!-- SmartMenus 끝 -->
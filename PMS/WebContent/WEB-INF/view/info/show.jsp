<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>项目管理系统</title>
		<%@ include file="/common/meta.jsp"%>
	</head>
    <body>
     
<style>
    .ac-tooltip{
    position:absolute;
    visibility:hidden;
    border : 1px solid #efefef;
    background-color: white;
    opacity: .8;
    padding: 20px;
     
    transition: top 200ms,left 200ms;
    -moz-transition: top 200ms,left 200ms; /* Firefox 4 */
    -webkit-transition: top 200ms,left 200ms; /* Safari 和 Chrome */
    -o-transition: top 200ms,left 200ms;
    }
     
    .ac-tooltip .ac-title{
    margin: 0;
    padding: 5px 0;
    }
     
    .ac-tooltip .ac-list{
    margin: 0;
    padding: 0;
    list-style: none;
    }
    .ac-tooltip li{
    line-height: 22px;
    }
    </style>
    <div style="margin-top: 10px;margin-left: 30px">
    	<font size="4">当前有</font>
    		<a href="#" class="page-action" data-href="${path}/warn/warnList.do?num=1" data-id="warnlist">
    			<span class="grid-command" style="font-size:27px;color: red">
    			${warnNum!=0?warnNum:0}
    			</span>
    		</a>
    		<font size="4">个未解决的报障单</font>
    	</div>
    <div style="margin-left: 330px;margin-top: 30px">
    	欢迎你<font size="4" color="red">${user.username}</font>
    	你可以进行<a href="#" class="page-action" data-href="${path}/warn/addUI.do" data-id="warnUI">
    		<font size="4" color="red">障碍提交</font></a>
    </div>
    <div class="detail-section">
	    <div id="canvas">
	    </div>
    </div>
    <div style="display:none">
      <div id="tip" class="ac-tooltip"><h3 class="ac-title"></h3><ul class="ac-list"></ul></div>
    </div>
</body>
   
<%@ include file="/common/footer.jsp"%>
<script type="text/javascript">
	  BUI.use('common/page');
</script>
<script type="text/javascript">
    var chart = new AChart({
        theme : AChart.Theme.SmoothBase,
        id : 'canvas',
        width : 1000,
        height : 500,
        plotCfg : {
          margin : [150,120,120] //画板的边距
        },
        xAxis : {
          categories : ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']
        },
        tooltip : {
          valueSuffix : '°C',
          shared : true, //是否多个数据序列共同显示信息
          custom : true, //自定义tooltip
          html : '#tip',//自定义tooltip的 模板或者 #id
          crosshairs : true //是否出现基准线
        },
        series :${dataChart}
    });
 
    chart.render();
</script>
</html>



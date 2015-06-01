//显示消息框
function showMessageBox(){
  	$("#myMessage").slideDown(800);
 }
 //隐藏消息框
function closeMessageBox(){
	$("#myMessage").slideUp(800);
}
function goToBackCall(){
	alert("AAA");
}
//拨打号码
function callNumber(){
	var telno = $("#telno").val();
	Btncall_onclick(telno);
}

//输入号码按回车事件
function EnterPress(e){ 
	var e = e || window.event; 
	if(e.keyCode == 13){
		callNumber();
	} 
} 

function test(){
	alert($(document.body).outerHeight(true));
}
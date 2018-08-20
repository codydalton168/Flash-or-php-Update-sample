var flashObj = null;



function onButtonClick(){


		flashObj.getupfile('1','2');
	
}


function getcrfile(filename,name) {




	alert(filename + name);


}


function chkFunction(id) {
	var div = document.createElement('div');
	div.id='chk_1';
	document.getElementById('cate').appendChild(div);
}

$(document).ready(function () {


	var params   = {
		menu: "false",
		scale: "noScale",
		allowScriptAccess: "always",
		value:'always',
		wmode:'transparent'
	};

	var attr = {id:'mutiuploada',name:'mutiuploada'};




	var flashVar = {

			Rupf : 1,
			Receiver_Function:"getupfile",
			Function:"getcrfile",
			Funchkf :"chkFunction",
			Funchkv : "1",
			attachment:"attachment",
			url: escape('update.php'),
			postaction:new Date().getTime(),
			attname:"images檔案",
			attfile:escape("*.png;*.jpg;*.gif;")
	};


	swfobject.embedSWF("upjs.swf", "flashContent", "400", "80", "11.5.31.139", "expressInstall.swf",flashVar,params,attr,function(e){
				flashObj = e.ref;
	});


});

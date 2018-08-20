package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.external.*;
	import flash.net.*;
	import fl.controls.Label;
	import fl.controls.ProgressBar;
	import fl.controls.ProgressBarMode;
	import flash.external.ExternalInterface;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.utils.*;

	import flash.display.Stage; 
	import flash.display.StageAlign; 
	import flash.display.StageScaleMode; 
	import flash.events.Event; 
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.net.LocalConnection;
	
	public class upjs extends Sprite{

		private var fileTypes:Array;
		private var file:FileReference;
		private var uploadURL:URLRequest;
		private var url:String = "http://localhost/test.php";
		private var postaction:String="null";
		private var attfile:String = "*.*;";
		private var attname:String = "全部檔案";
		//private var id:uint;
		private var loader:URLLoader;
		private var Functiond:String = null;
		private var attachment:String = null;
		private var Receiver_Function:String = null;
		private var Rupfk:int = 0;
		private var Funchkf:String = null;
		private var Funchkv:String = null;
		private var Funchkg:String = null;
		private var Funchkw:String = null;
		//private var checkver:int=0;
		//private var checkimgtype:Boolean = false;
		private var checkgetup:Boolean = false;
		public function upjs(){
			
			
				var pmsg:TextFormat = new TextFormat();
				var ptxt:TextFormat = new TextFormat(); 
				pmsg.color = 0x000000;
				pmsg.size = 12;
				ptxt.color = 0x000000;
				ptxt.size = 12;
				upmsg.setStyle("textFormat", ptxt);	
				FilePath.setStyle("textFormat", pmsg);	
				bt.setStyle("textFormat", ptxt);
				//upf.setStyle("textFormat", ptxt);
				/*
				if (this.loaderInfo.parameters["checkvered"] != undefined){
							checkver = this.loaderInfo.parameters["checkvered"];
				}
				
				if (this.loaderInfo.parameters["checkimg"] != undefined && String(this.loaderInfo.parameters["checkimg"]) == "true"){
						this.checkimgtype = true;
				}
				*/
				if (this.loaderInfo.parameters["url"] != undefined){
						this.url = this.loaderInfo.parameters["url"];
				}

				//this.id = this.loaderInfo.parameters["id"];
				if (this.loaderInfo.parameters["attfile"] != undefined){
					this.attfile = this.loaderInfo.parameters["attfile"];
				}

				if (this.loaderInfo.parameters["attname"] !=undefined){
					this.attname = this.loaderInfo.parameters["attname"];
				}
			
				if (this.loaderInfo.parameters["Receiver_Function"] !=undefined){
					this.Receiver_Function = this.loaderInfo.parameters["Receiver_Function"];
				}
			
			
				//上傳完呼叫 javascript Function
				if (this.loaderInfo.parameters["Function"] !=undefined){
					this.Functiond = this.loaderInfo.parameters["Function"];
				}
			
				if (this.loaderInfo.parameters["attachment"] !=undefined){
					this.attachment = this.loaderInfo.parameters["attachment"];
				}

				
				if (this.loaderInfo.parameters["Funchkf"] !=undefined){
					this.Funchkf = this.loaderInfo.parameters["Funchkf"];
				}
			
				if (this.loaderInfo.parameters["Funchkv"] !=undefined){
					this.Funchkv = this.loaderInfo.parameters["Funchkv"];
				}
				
				if (this.loaderInfo.parameters["Funchkg"] !=undefined){
					this.Funchkg = this.loaderInfo.parameters["Funchkg"];
				}
			
				if (this.loaderInfo.parameters["Funchkw"] !=undefined){
						this.Funchkw = this.loaderInfo.parameters["Funchkw"];
				}
			
			
			
				//trace(this.loaderInfo.parameters["Rupf"]);  
			
				if (this.loaderInfo.parameters["postaction"] != undefined){
						this.postaction = this.loaderInfo.parameters["postaction"];
				}
			
			
				if (this.loaderInfo.parameters["Rupf"] != undefined){
						this.Rupfk = this.loaderInfo.parameters["Rupf"];
				}
			
				if (Receiver_Function != null){
						ExternalInterface.addCallback(Receiver_Function,this.crgetupfile);
				}

				file = new FileReference();

				this.bt.addEventListener(MouseEvent.CLICK, this.selectFiles);
				//this.upf.addEventListener(MouseEvent.CLICK, this.getupfile);
				file.addEventListener(Event.SELECT, this.selectHandler);
				
				/*
				if(this.checkimgtype == true){
					file.addEventListener(Event.COMPLETE, this.securityTypeHandler);
				}
				*/
				
				this.pr.mode = ProgressBarMode.MANUAL;
				this.pr.maximum = 100;
				this.prtxt.text = '0%';



				setTimeout(function(){
					
					if(Rupfk == 1){
						
						//upf.visible = false;
						bt.x = 337.30;
						FilePath.width = 300;
					}   
					//pr.visible = false;
					//prtxt.visible = false; 
					upmsg.text="請選擇 "+attname+" (副檔名為 "+attfile+" 上傳)";
				},50);
				/*
				if(checkver == 0){
					checkversion();
				}
				*/
		}
		
		/*
		private function checkversion():void{

				var localDomainLC:LocalConnection = new LocalConnection();
				//var myDomainName = localDomainLC.domain; 
				
				if(localDomainLC.domain != "www.jbjgold.com"){
					
					var myFormat:TextFormat = new TextFormat();
					myFormat.size = 15;
					//myFormat.color = 0xFFFFFF;
					var myText:TextField = new TextField();
					myText.defaultTextFormat = myFormat;
					myText.text = "您已經侵犯版權,目前已經把您的 SERVER 端ip記錄,將保留法律追訴權!";
					addChild(myText);
					
					myText.border = true;
					myText.wordWrap = true;
					myText.width = 320;
					myText.height = 50;
					myText.x = 2;
					myText.y = 2;

					
					setTimeout(function(){
						FilePath.visible =  false;
						upmsg.visible = false;
						prtxt.visible = false;
						pr.visible = false;
						
						bt.visible = false;
						upf.visible = false;

					},50);
				}

		}
		*/
		
		private function selectFiles(event:MouseEvent):void{
				try{
					file.browse([new FileFilter(this.attname+"("+this.attfile+")",this.attfile)]);
					
				}catch (error:Error){
						//file.cancel();
						ExternalInterface.call("alert", "瀏覽檔案異常?");
				}
				return;
		}
		
		private function selectHandler(event:Event):void{
				file.load();
				
				//ExternalInterface.call('alert',String(int(file.size/1024)));
			
			
				//if(this.checkimgtype == false){
						FilePath.text = event.currentTarget.name.toString();
						if(Funchkf != null){
								ExternalInterface.call(Funchkf,Funchkv);
						}
				//}
		}
		/*
		private function securityTypeHandler(event:Event):void{
				var t:ByteArray = event.target.data;//获得文件二进制流
				var name:String = event.target.name;//获得文件名称
				var type:String = event.target.type;//获得后缀名称
				var tnum:String = String(t.readUnsignedShort());//读取文件一个16位的整
				var results:String;
				if(checkgetup == false){
					if(tnum=="65496" || tnum == "35152" || tnum=="18249"){
						
						FilePath.text = event.currentTarget.name.toString();
						if(Funchkf != null){
								ExternalInterface.call(Funchkf,Funchkv);
						}
						//bt.enabled=false;
					} else {
						
						FilePath.text = "請選擇圖片檔案上傳...";
						
						file.cancel();
						
						if(Funchkg != null){
								ExternalInterface.call(Funchkg,Funchkw);
						}
						
						ExternalInterface.call('alert','您所選擇 '+name+' 不是正實編碼圖片檔案,禁止上傳?');
					}
				}
		}
		*/
		/*
		public function getupfile(event:MouseEvent):void{
					if (url == null){
						FilePath.text = "找不到可以接收網址";
						return;
					}
					
					bt.enabled = false;
					var loader:URLLoader = new URLLoader();
					var params:URLVariables = new URLVariables();
					params.t = new Date().getTime();
					params.action = this.postaction;

					uploadURL = new URLRequest(this.url);
					uploadURL.method = URLRequestMethod.POST;
					uploadURL.contentType = "multipart/form-data";	
					uploadURL.data = params;
					
					
					checkgetup = true;
					upmsg.visible = false;
					file.addEventListener(ProgressEvent.PROGRESS, progressHandler);
					file.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA, completeHandler);
					file.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
					file.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
					file.upload(uploadURL,'attachment');
		}
		*/

		public function crgetupfile(value1:String,value2:String):void{
					if (url == null){
						FilePath.text = "找不到可以接收網址";
						return;
					}
					
					bt.enabled = false;
					var loader:URLLoader = new URLLoader();
					var params:URLVariables = new URLVariables();
					params.t = new Date().getTime();
					params.action = this.postaction;
					if(value1.length > 0){
							params.category = value1;
					}
					
					if(value2.length > 0){
							params.binds = value2;
					}
					uploadURL = new URLRequest(this.url);
					uploadURL.method = URLRequestMethod.POST;
					uploadURL.data = params;
					

					
					
					checkgetup = true;
					pr.visible = true;
					prtxt.visible = true; 
					upmsg.visible = false; 

					file.addEventListener(ProgressEvent.PROGRESS, progressHandler);
					file.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
					file.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
					file.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA, completeHandler);
					file.upload(uploadURL,'attachment');

		}

		private function progressHandler(event:ProgressEvent):void{
					this.prtxt.text = Math.floor((event.bytesLoaded/event.bytesTotal)*100) + "%";
					this.pr.setProgress(Math.floor((event.bytesLoaded/event.bytesTotal)*100),this.pr.maximum);
			
					if(Math.floor((event.bytesLoaded/event.bytesTotal)*100) == 100){
						
							this.prtxt.text = '0%';
							this.pr.setProgress(0,this.pr.maximum);
						/*
						setTimeout(function(){
							upmsg.visible = true;
							upmsg.text = '正在 Excel 匯入及複製檔案中...';
						},50);*/
					}
		}
		
		
		function completeHandler(evt:DataEvent):void{
					this.FilePath.text = '請選擇Excel 檔案上傳...';
					this.prtxt.text = '0%';
					this.pr.setProgress(0,this.pr.maximum);
					pr.visible = true;
					prtxt.visible = true; 
					upmsg.visible = true; 
					checkgetup = false;
					bt.enabled = true;
			
					//file.cancel() ;
			
					upmsg.text="請選擇 "+attname+" (副檔名為 "+attfile+" 上傳)";
			
					file.removeEventListener(ProgressEvent.PROGRESS, progressHandler);
					file.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
					file.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
					file.removeEventListener(DataEvent.UPLOAD_COMPLETE_DATA, completeHandler);
					file.removeEventListener(Event.SELECT, this.selectHandler);
			
					file = null;
					file = new FileReference();
			
			
					file.addEventListener(Event.SELECT, this.selectHandler);
					if (Functiond != null){
							ExternalInterface.call(Functiond,evt.data,attachment);
					}

		}
		
		public function onIOError(evt:IOErrorEvent):void {
					trace("There was an IO Error.");
					ExternalInterface.call("alert", "上傳異常?");
		}

		public function onSecurityError(evt:Event):void  { 
					trace("There was a security error."); 
					ExternalInterface.call("alert", "安全性的問題無法上傳?");
		} 

	}

}
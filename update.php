<?php



if(is_uploaded_file($_FILES['attachment']['tmp_name'])){
              $upimages_name = $_FILES['attachment']['name'];
		$upimages_type = $_FILES['attachment']['type'];
		$upimages_temp = $_FILES['attachment']['tmp_name'];

		$upimagestype = strtolower(substr(strrchr($upimages_name,'.'),1));

		$prename = time()."_".rand(1,1000).".".$upimagestype;

		$dirextract='./temp/';

		//Create_Folder($dirextract);

		$upatch =   $dirextract.$prename;

		if(!@move_uploaded_file($upimages_temp,$upatch)){

			$errormsg = mb_convert_encoding("�w�g $upimages_name �W�ǥ���,��]�i��W���|�����~",'utf-8','big5');
			echo 'error|'.$errormsg;
			exit;
		}


			echo 'error|'.$prename;
			exit;

} 










?>
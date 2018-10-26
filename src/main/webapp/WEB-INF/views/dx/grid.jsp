<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${skyPath}/dhtmlx.css" />
</head>
<script>
	var mData = [ {
		id : 'delete',
		text : 'delete'
	}, {
		id : 'add',
		text : 'Add Row'
	}, {
		id : 'update',
		text : 'update'
	} ]; //text를 누르면 id가 실행이 된다
	var dxGrid, dxMenu;
	function doInit() {
		dxMenu = new dhtmlXMenuObject(); //dxMenu가 오른쪽 버튼 눌렀을때 나오는것   
		dxMenu.setIconsPath("../common/images/");
		dxMenu.renderAsContextMenu();
		dxMenu.attachEvent("onClick", function(mId, type) {
			console.log(mId);
			console.log(type);
			if (mId == 'delete') { //mData에 나오는 mId
				var rId = dxGrid.getSelectedRowId();
				if (!rId) {
					alert("삭제할 로우를 선택해주세요");
					return;

				}
				var cIdx = dxGrid.getColIndexById('student_num');//아이디가 student_num인것을 가져옴
				var studentnum = dxGrid.cells(rId, cIdx).getValue();
				alert(studentnum);
				dhx.ajax.del('/studentinfo/' + studentnum);
				alert("삭제완료");

			} else if (mId == 'add') { //mData에 나오는 mId
				dhx.ajax.get('/studentnum', function(res) {
					var data = JSON.parse(res.xmlDoc.responseText);
					var rId = dxGrid.uid();//유니크아이디
					dxGrid.addRow(rId, [ data ], dxGrid.getRowsNum()); //로우 아이디,각 행의 값,열번호
					dxGrid.setRowAttribute(rId, "st", "new");//로우아이디,행의값,값
				})
			} else if (mId == 'update') {
				var conf= {
						url : '/studentinfo/' + studentnum,
						method : 'PUT',
						param : params,
						success : function(response){
							if(response==1){
								alert("수정 성공");	
								
			}
				

						}			

					}
							
			

			var au = new AjaxUtil(conf);
			au.send();
			}
		});
		dxMenu.loadStruct(mData);
		dxGrid = new dhtmlXGridObject('dxGrid');
		dxGrid.setImagePath('${skyPath}/imgs/');
		dxGrid.setHeader('번호,이름,전공,이수시간');
		dxGrid.setColumnIds('student_num,student_name,student_major,total_credit_hour');
		dxGrid.setColTypes('ro,ed,ed,ed');
		dxGrid.enableContextMenu(dxMenu);
		dxGrid.init();
		//dxGrid.parse(data,'js');	
		dhx.ajax.get('/studentinfo', function(res) {
			var data = JSON.parse(res.xmlDoc.responseText);
			dxGrid.parse(data, 'js');
		})
		dxGrid.attachEvent('onEditCell', function(stage, rId, cInd, nValue,
				oValue) { //로우아이디,컬럼아이디,바뀐값,원래값
			if (stage == 2) {
				if (dxGrid.getRowAttribute(rId, "st") == 'new') {
					return true;
				}
				if (nValue != oValue) {
					var rData = dxGrid.getRowData(rId);
					dhx.ajax.put('/studentinfo/' + rData.student_num + '?'
							+ makeParams(rData), function(res) {
						var data = JSON.parse(res.xmlDoc.responseText);
						alert(data);
						return true;
					})
				}

			}
		})
	}

	function makeParams(data) {
		var params = '';
		for ( var key in data) {
			params += key + '=' + data[key] + '&';
		}
		return params.substring(0, params.length - 1);
	}

	window.addEventListener('load', doInit);
</script>
<body>
	<div id="dxGrid" style="width: 400px; height: 300px;"></div>
</body>
</html>
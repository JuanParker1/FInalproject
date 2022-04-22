<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="/resources/fancytree/src/jquery.fancytree.js"></script>
<script src="/resources/fancytree/src/jquery.fancytree.dnd.js"></script> 
<script src="/resources/fancytree/src/jquery.fancytree.edit.js"></script>
</head>
<body>
<table id="tree" class="fancytree-container fancytree-ext-table fancytree-checkbox-auto-hide fancytree-ext-edit fancytree-ext-dnd5 fancytree-ext-gridnav" tabindex="0" role="treegrid" aria-multiselectable="true" aria-readonly="true">
			<colgroup>
				<col width="30px">
				<col width="50px">
				<col width="350px">
				<col width="50px">
				<col width="50px">
				<col width="30px">
				<col width="30px">
				<col width="50px">
			</colgroup>
			<thead>
				<tr>
					<th></th>
					<th>#</th>
					<th></th>
					<th>Ed1</th>
					<th>Ed2</th>
					<th>Rb1</th>
					<th>Rb2</th>
					<th>Cb</th>
				</tr>
			</thead>
			<tbody><tr role="row" aria-expanded="true" aria-selected="false" class="fancytree-expanded fancytree-folder fancytree-has-children fancytree-exp-e fancytree-ico-ef">
					<td class="alignCenter" role="gridcell"><span role="checkbox" class="fancytree-checkbox"></span></td>
					<td role="gridcell">1</td>
					<td role="gridcell" colspan="6"><span class="fancytree-node" draggable="true" style="padding-left: 0px;"><span role="button" class="fancytree-expander"></span><span role="presentation" class="fancytree-icon"></span><span class="fancytree-title" tabindex="0">Books</span></span></td>
					
					
					
					
					
				</tr><tr role="row" aria-selected="false" class="fancytree-exp-n fancytree-ico-c">
					<td class="alignCenter" role="gridcell"><span role="checkbox" class="fancytree-checkbox"></span></td>
					<td role="gridcell">1.1</td>
					<td role="gridcell"><span class="fancytree-node" draggable="true" style="padding-left: 20px;"><span class="fancytree-expander"></span><span role="presentation" class="fancytree-icon"></span><span class="fancytree-title" tabindex="0">Art of War</span></span></td>
					<td role="gridcell"><input name="input1" type="input"></td>
					<td role="gridcell"><input name="input2" type="input"></td>
					<td class="alignCenter" role="gridcell">
						<input name="cb1" type="checkbox">
					</td>
					<td class="alignCenter" role="gridcell">
						<input name="cb2" type="checkbox">
					</td>
					<td role="gridcell">
						<select name="sel1" id="">
							<option value="a">A</option>
							<option value="b">B</option>
						</select>
					</td>
				</tr><tr role="row" aria-selected="false" class="fancytree-exp-n fancytree-ico-c">
					<td class="alignCenter" role="gridcell"><span role="checkbox" class="fancytree-checkbox"></span></td>
					<td role="gridcell">1.2</td>
					<td role="gridcell"><span class="fancytree-node" draggable="true" style="padding-left: 20px;"><span class="fancytree-expander"></span><span role="presentation" class="fancytree-icon"></span><span class="fancytree-title" tabindex="0">The Hobbit</span></span></td>
					<td role="gridcell"><input name="input1" type="input"></td>
					<td role="gridcell"><input name="input2" type="input"></td>
					<td class="alignCenter" role="gridcell">
						<input name="cb1" type="checkbox">
					</td>
					<td class="alignCenter" role="gridcell">
						<input name="cb2" type="checkbox">
					</td>
					<td role="gridcell">
						<select name="sel1" id="">
							<option value="a">A</option>
							<option value="b">B</option>
						</select>
					</td>
				</tr><tr role="row" aria-selected="false" class="fancytree-exp-n fancytree-ico-c">
					<td class="alignCenter" role="gridcell"><span role="checkbox" class="fancytree-checkbox"></span></td>
					<td role="gridcell">1.3</td>
					<td role="gridcell"><span class="fancytree-node" draggable="true" style="padding-left: 20px;"><span class="fancytree-expander"></span><span role="presentation" class="fancytree-icon"></span><span class="fancytree-title" tabindex="0">The Little Prince</span></span></td>
					<td role="gridcell"><input name="input1" type="input"></td>
					<td role="gridcell"><input name="input2" type="input"></td>
					<td class="alignCenter" role="gridcell">
						<input name="cb1" type="checkbox">
					</td>
					<td class="alignCenter" role="gridcell">
						<input name="cb2" type="checkbox">
					</td>
					<td role="gridcell">
						<select name="sel1" id="">
							<option value="a">A</option>
							<option value="b">B</option>
						</select>
					</td>
				</tr><tr role="row" aria-selected="false" class="fancytree-lastsib fancytree-exp-nl fancytree-ico-c">
					<td class="alignCenter" role="gridcell"><span role="checkbox" class="fancytree-checkbox"></span></td>
					<td role="gridcell">1.4</td>
					<td role="gridcell"><span class="fancytree-node" draggable="true" style="padding-left: 20px;"><span class="fancytree-expander"></span><span role="presentation" class="fancytree-icon"></span><span class="fancytree-title" tabindex="0">Don Quixote</span></span></td>
					<td role="gridcell"><input name="input1" type="input"></td>
					<td role="gridcell"><input name="input2" type="input"></td>
					<td class="alignCenter" role="gridcell">
						<input name="cb1" type="checkbox">
					</td>
					<td class="alignCenter" role="gridcell">
						<input name="cb2" type="checkbox">
					</td>
					<td role="gridcell">
						<select name="sel1" id="">
							<option value="a">A</option>
							<option value="b">B</option>
						</select>
					</td>
				</tr><tr role="row" aria-expanded="false" aria-selected="false" class="fancytree-folder fancytree-has-children fancytree-exp-c fancytree-ico-cf">
					<td class="alignCenter" role="gridcell"><span role="checkbox" class="fancytree-checkbox"></span></td>
					<td role="gridcell">2</td>
					<td role="gridcell" colspan="6"><span class="fancytree-node" draggable="true" style="padding-left: 0px;"><span role="button" class="fancytree-expander"></span><span role="presentation" class="fancytree-icon"></span><span class="fancytree-title" tabindex="0">Music</span></span></td>
					
					
					
					
					
				</tr><tr role="row" aria-expanded="true" aria-selected="false" class="fancytree-expanded fancytree-folder fancytree-has-children fancytree-exp-e fancytree-ico-ef">
					<td class="alignCenter" role="gridcell"><span role="checkbox" class="fancytree-checkbox"></span></td>
					<td role="gridcell">3</td>
					<td role="gridcell" colspan="6"><span class="fancytree-node" draggable="true" style="padding-left: 0px;"><span role="button" class="fancytree-expander"></span><span role="presentation" class="fancytree-icon"></span><span class="fancytree-title" tabindex="0">Electronics &amp; Computers</span></span></td>
					
					
					
					
					
				</tr><tr role="row" aria-expanded="false" aria-selected="false" class="fancytree-folder fancytree-has-children fancytree-exp-c fancytree-ico-cf">
					<td class="alignCenter" role="gridcell"><span role="checkbox" class="fancytree-checkbox"></span></td>
					<td role="gridcell">3.1</td>
					<td role="gridcell" colspan="6"><span class="fancytree-node" draggable="true" style="padding-left: 20px;"><span role="button" class="fancytree-expander"></span><span role="presentation" class="fancytree-icon"></span><span class="fancytree-title" tabindex="0">Cell Phones</span></span></td>
					
					
					
					
					
				</tr><tr role="row" aria-expanded="false" aria-selected="false" class="fancytree-folder fancytree-has-children fancytree-lastsib fancytree-exp-cl fancytree-ico-cf">
					<td class="alignCenter" role="gridcell"><span role="checkbox" class="fancytree-checkbox"></span></td>
					<td role="gridcell">3.2</td>
					<td role="gridcell" colspan="6"><span class="fancytree-node" draggable="true" style="padding-left: 20px;"><span role="button" class="fancytree-expander"></span><span role="presentation" class="fancytree-icon"></span><span class="fancytree-title" tabindex="0">Computers</span></span></td>
					
					
					
					
					
				</tr><tr role="row" aria-expanded="false" aria-selected="false" class="fancytree-folder fancytree-has-children fancytree-lastsib fancytree-lazy fancytree-exp-cdl fancytree-ico-cf">
					<td class="alignCenter" role="gridcell"><span role="checkbox" class="fancytree-checkbox"></span></td>
					<td role="gridcell">4</td>
					<td role="gridcell" colspan="6"><span class="fancytree-node" draggable="true" style="padding-left: 0px;"><span role="button" class="fancytree-expander"></span><span role="presentation" class="fancytree-icon"></span><span class="fancytree-title" tabindex="0">More...</span></span></td>
					
					
					
					
					
				</tr></tbody>
		</table>
</body>
</html>

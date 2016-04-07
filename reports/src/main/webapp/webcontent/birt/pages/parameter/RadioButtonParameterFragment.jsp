<%-----------------------------------------------------------------------------
	Copyright (c) 2004 Actuate Corporation and others.
	All rights reserved. This program and the accompanying materials 
	are made available under the terms of the Eclipse Public License v1.0
	which accompanies this distribution, and is available at
	http://www.eclipse.org/legal/epl-v10.html
	
	Contributors:
		Actuate Corporation - Initial implementation.
-----------------------------------------------------------------------------%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="false" buffer="none" %>
<%@ page import="org.eclipse.birt.report.context.ScalarParameterBean,
				 org.eclipse.birt.report.context.BaseAttributeBean,
				 org.eclipse.birt.report.service.api.ParameterSelectionChoice,
				 org.eclipse.birt.report.utility.ParameterAccessor,
				 org.eclipse.birt.report.utility.DataUtil,
				 org.eclipse.birt.report.IBirtConstants" %>

<%-----------------------------------------------------------------------------
	Expected java beans
-----------------------------------------------------------------------------%>
<jsp:useBean id="attributeBean" type="org.eclipse.birt.report.context.BaseAttributeBean" scope="request" />

<%-----------------------------------------------------------------------------
	Radio button parameter control
-----------------------------------------------------------------------------%>
<%
	ScalarParameterBean parameterBean = ( ScalarParameterBean ) attributeBean.getParameterBean( );
	String encodedParameterName = ParameterAccessor.htmlEncode( parameterBean.getName( ) );
	boolean isDisplayTextInList = parameterBean.isDisplayTextInList( );
%>
<TR>
	<%-- 
	  28.07.2010 Antti Leppä
	  
	  Changed context help to behave as it does in other views of Pyramus   
	--%>
	<TD nowrap="nowrap">
		<IMG SRC="birt/images/parameter.gif" ALT="<%= parameterBean.getDisplayName( ) %>"/>
	</TD>
	<TD nowrap="nowrap">
		<FONT><%= parameterBean.getDisplayName( ) %>:</FONT>
		
		<jsp:include page="ParameterContextHelpFragment.jsp">
		  <jsp:param name="text" value="<%= parameterBean.getToolTip( ) %>"/>
		</jsp:include>
		
		<%-- is required --%>
		<%
		if ( parameterBean.isRequired( ) )
		{
		%>
			<FONT COLOR="red">*</FONT>
		<%
		}
		%>
	</TD>
</TR>
<TR>
	<TD nowrap="nowrap"></TD>
	<TD nowrap="nowrap" WIDTH="100%">
	<INPUT TYPE="HIDDEN" ID="control_type" VALUE="radio"/>
	<INPUT TYPE="HIDDEN" ID="data_type" VALUE="<%="" + parameterBean.getParameter( ).getDataType( ) %>"/>
	<%-- Parameter control --%>
<%
	if (parameterBean.getSelectionList( ) != null)
	{
		boolean CHECKED;
		boolean isSelected = false;
		for ( int i = 0; i < parameterBean.getSelectionList( ).size( ); i++ )
		{
			ParameterSelectionChoice selectionItem = ( ParameterSelectionChoice )parameterBean.getSelectionList( ).get( i );						
			String label = selectionItem.getLabel( );
			String value = ( String ) selectionItem.getValue( );
			String encodedValue = ParameterAccessor.htmlEncode(( value == null )?IBirtConstants.NULL_VALUE:value);
			
			CHECKED = ( DataUtil.equals( parameterBean.getValue( ), value )
						&& ( !isDisplayTextInList || ( isDisplayTextInList && label.equals( parameterBean.getDisplayText( ) ) ) ) );						
%>
	<INPUT TYPE="RADIO"
		NAME="<%= encodedParameterName %>"
		ID="<%= encodedParameterName + i %>" 
		TITLE="<%= parameterBean.getToolTip( ) %>"
		VALUE="<%= encodedValue %>"
		<%= !isSelected && CHECKED ? "CHECKED=\"CHECKED\"" : "" %>>
		<LABEL ID="<%= (encodedParameterName + i) + "_label" %>" 
		   TITLE="<%= ParameterAccessor.htmlEncode( label ) %>" 
		   FOR="<%= encodedParameterName + i %>"><%= ParameterAccessor.htmlEncode( label ) %></LABEL>
	</INPUT>
	<BR>
<%
			if( CHECKED )
				isSelected = true;
		}
	}	

%>
	</TD>
</TR>
﻿<%@ Control Language="C#" %>
<%@ Import Namespace="Hidistro.Core" %>
<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.Common.Controls" Assembly="Hidistro.UI.Common.Controls" %>
<li>
<a href="ProductList.aspx?BrandId=<%# Eval("BrandId")%>">
    <div class="well">
        <img src="<%# Eval("Logo")%>" class="img-responsive">
        <div class="name font-l" style="overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;">
            <%# Eval("BrandName")%></div>
    </div>
</a>
</li>
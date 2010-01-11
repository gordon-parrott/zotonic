{# Show the edit fields to edit the name of a person #}
{% with m.rsc[id] as r %}
<div class="item-wrapper">
	<h3 class="above-item clearfix do_blockminifier { minifiedOnInit: false }">
		<span class="title">Search query</span>
		<span class="arrow">make smaller</span>
	</h3>
	
	<div class="item">
		<fieldset class="admin-form">
			<div class="notification notice">
				Here you can edit the arguments of the  search query. Every argument goes on its own line. For more information, see the
				<a href="http://zotonic.com/documentation/761/the-query-search-model">documentation on the query arguments</a> on the Zotonic website.
			</div>
			
            <div class="form-item clearfix">
                <label for="query">Query</label>
                <textarea id="{{ #query }}" name="query" rows="15">{{ r.query }}</textarea>
                <a class="button" href="javascript:;">Preview</a>
                {% wire id=#query type="change" postback={query_preview rsc_id=id div_id=#querypreview} delegate="resource_admin_edit" %}
            </div>

            <h3>Query preview</h3>
            <div class="query-results" id="{{ #querypreview }}">
                {% include "_admin_query_preview.tpl" result=m.search[{query query_id=id}] %}
            </div>
		</fieldset>
	</div>
</div>
{% endwith %}

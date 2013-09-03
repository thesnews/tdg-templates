{#gryphon/section/modules/viewpoints.tpl#}

<div class="row-fluid">
	<div class="span8">
		{{ articleRender.secondary(first_main) }}
	</div>
	<div class="span4">
		{% for item in more %}
			{{ articleRender.sidebar(item)}}
		{% endfor %}
	</div>
</div>


<hr/>


<div class="row-fluid">
	{% fetch second from article with [
					'order': 'weight desc, created desc',
					'limit': '4',
					'where': 'status = 1',
					'withTags': ['guest column']
	] %}

	{% set second_main = second.shift() %}
	{% set more = second.shift(3) %}
	<div class="span12">
		<span><h1 style="display: inline;">Columns</h1><a href="{{ 'section/guest-column'|url }}" class="pull-right blue">more columns</a></span>
		<hr class="spacer"/>
	</div>
</div>

<div class="row-fluid">
	<div class="span8">
		{{ articleRender.secondary(second_main) }}
	</div>
	<div class="span4">
		{% for item in more %}
			{{ articleRender.sidebar(item) }}
		{% endfor %}
	</div>
</div>
<hr/>


<div class="row-fluid">
	{% fetch third from article with [
					'order': 'weight desc, created desc',
					'limit': '4',
					'where': 'status = 1',
					'withTags': ['letters to the editor']
	] %}

	{% set third_main = third.shift() %}
	{% set more = third.shift(3) %}
	<div class="span12">
		<span><h1 style="display: inline;">Letters</h1><a href="{{ 'section/letters-to-the-editor'|url }}" class="pull-right blue">more letters</a></span>
		<hr class="spacer"/>
	</div>
</div>

<div class="row-fluid">
	<div class="span8">
		{{ articleRender.secondary(third_main) }}
	</div>
	<div class="span4">
		{% for item in more %}
			{{ articleRender.sidebar(item) }}
		{% endfor %}
	</div>
</div>

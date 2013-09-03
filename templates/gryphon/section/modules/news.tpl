{#gryphon/section/modules/news.tpl #}

<div class="row-fluid">


	{% fetch campus from article with [
					'order': 'weight desc, created desc',
					'limit': '4',
					'where': 'status = 1',
					'withTags': ['news', 'campus']
	] %}

	{% set campus_main = campus.shift() %}
	{% set more = campus.shift(3) %}
	<div class="span12">
		<span><h1 style="display: inline;">Campus</h1><a href="{{ 'section/campus'|url }}" class="pull-right blue">more campus</a></span>
		<hr class="spacer"/>
	</div>

</div>

<div class="row-fluid">
	<div class="span8">
		{{ articleRender.secondary(campus_main) }}
	</div>
	<div class="span4">
		{% for item in more %}
			{{ articleRender.sidebar(item)}}
		{% endfor %}
	</div>
</div>


<hr/>


<div class="row-fluid">
	{% fetch columbia from article with [
					'order': 'weight desc, created desc',
					'limit': '4',
					'where': 'status = 1',
					'withTags': ['news', 'columbia']
	] %}

	{% set columbia_main = columbia.shift() %}
	{% set more_columbia = columbia.shift(3) %}
	<div class="span12">
		<span><h1 style="display: inline;">Columbia</h1><a href="{{ 'section/columbia'|url }}" class="pull-right blue">more columbia</a></span>
		<hr class="spacer"/>
	</div>
</div>

<div class="row-fluid">
	<div class="span8">
		{{ articleRender.secondary(columbia_main) }}
	</div>
	<div class="span4">
		{% for item in more_columbia %}
			{{ articleRender.sidebar(item) }}
		{% endfor %}
	</div>
</div>
<hr/>


<div class="row-fluid">
	{% fetch in_brief from article with [
					'order': 'weight desc, created desc',
					'limit': '4',
					'where': 'status = 1',
					'withTags': ['news', 'in brief']
	] %}

	{% set inbrief = in_brief.shift() %}
	{% set more_inbrief = in_brief.shift(3) %}
	<div class="span12">
		<span><h1 style="display: inline;">In Brief</h1><a href="{{ 'section/in-brief'|url }}" class="pull-right blue">more in brief</a></span>
		<hr class="spacer"/>
	</div>
</div>

<div class="row-fluid">
	<div class="span8">
		{{ articleRender.secondary(inbrief) }}
	</div>
	<div class="span4">
		{% for item in more_inbrief %}
			{{ articleRender.sidebar(item) }}
		{% endfor %}
	</div>
</div>

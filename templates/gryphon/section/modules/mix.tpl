{# gryphon/section/modules/mix.tpl #}

<div class="row-fluid">


	{% fetch first from article with [
					'order': 'weight desc, created desc',
					'limit': '4',
					'where': 'status = 1',
					'withTags': ['culture']
	] %}

	{% set first_main = first.shift() %}
	{% set more = first.shift(3) %}
	<div class="span12">
		<span><h1 style="display: inline;">Culture</h1><a href="{{ 'section/culture'|url }}" class="pull-right blue">more culture</a></span>
		<hr class="spacer"/>
	</div>

</div>

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
					'withTags': ['movies']
	] %}

	{% set second_main = second.shift() %}
	{% set more = second.shift(3) %}
	<div class="span12">
		<span><h1 style="display: inline;">Movies</h1><a href="{{ 'section/movies'|url }}" class="pull-right blue">more movies</a></span>
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
					'withTags': ['music']
	] %}

	{% set third_main = third.shift() %}
	{% set more = third.shift(3) %}
	<div class="span12">
		<span><h1 style="display: inline;">Music</h1><a href="{{ 'section/music'|url }}" class="pull-right blue">more music</a></span>
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

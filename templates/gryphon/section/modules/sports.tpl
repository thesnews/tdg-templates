{# gryphon/section/modules/sports.tpl #}

<div class="row-fluid">


	{% fetch first from article with [
					'order': 'weight desc, created desc',
					'limit': '4',
					'where': 'status = 1',
					'withTags': ['baseball']
	] %}

	{% set first_main = first.shift() %}
	{% set more = first.shift(3) %}
	<div class="span12">
		<span><h1 style="display: inline;">Baseball</h1><a href="{{ 'section/baseball'|url }}" class="pull-right blue">more baseball</a></span>
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
					'withTags': ['softball']
	] %}

	{% set second_main = second.shift() %}
	{% set more = second.shift(3) %}
	<div class="span12">
		<span><h1 style="display: inline;">Softball</h1><a href="{{ 'section/softball'|url }}" class="pull-right blue">more softball</a></span>
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
					'withTags': ['basketball']
	] %}

	{% set third_main = third.shift() %}
	{% set more = third.shift(3) %}
	<div class="span12">
		<span><h1 style="display: inline;">Basketball</h1><a href="{{ 'section/basketball'|url }}" class="pull-right blue">more basketball</a></span>
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

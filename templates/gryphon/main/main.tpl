{#gryphon/main/main.tpl #}

{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ config.get('dsw:siteslogan') }}{% endblock %}
{% block description %}{% endblock %}
{% block activeNav %}home{% endblock %}

{% block content %}

{% import "macros/article.tpl" as articleRender %}
{% import "macros/render.tpl" as render %}
{% import "macros/meta.tpl" as metaRender %}

{% set featured_story = articles.shift() %}
{% set top_stories = articles.shift(3) %}

<div class="row">
	<div class="span8">
<!-- Breaking -->
		{% if breaking %}
			<header class="breaking">
				<h4>Breaking News</h4>
				Updated {{ breaking.modified|timeSince }}
			</header>
			<hr class="half spacer" />

			<div class="breaking-box">
				<h3>
					<a href="{{ breaking.url }}">{{ breaking.headline }}</a>
				</h3>
			</div>
			<hr class="double spacer" />
		{% endif %}
		<!-- End of Breaking -->

		<!-- Developing -->
		{% if developing %}
			<header class="developing">
				<h4>Developing Story</h4>

   				    Updated {{ developing.modified|timeSince }}

			</header>
			<hr class="half spacer" />

			<div class="breaking-box">
				<h3>
					<a href="{{ developing.url }}">{{ developing.headline }}</a>
				</h3>
			</div>
			<hr class="double spacer" />
		{% endif %}
		<!-- End of Developing -->

		<!-- Top Stories -->
		<div class="row-fluid">
			<div class="span5">
				{% for story in top_stories %}
					{{ articleRender.topSidebar(story) }}
				{% endfor %}
			</div>
			<div class="span7">
				{{ articleRender.centerpiece(featured_story) }}
			</div>
		</div>
		<!-- End of Top Stories -->

		
		
		<!-- Multimedia Box -->
		<div class="row-fluid">
			<div class="span12">
				<h2>Multimedia</h2>
				{% include 'gryphon/multimedia/mm_carousel.tpl' %}
			</div>
		</div>
		<!-- End of Multimedia Box -->
		
		<hr/>

		<!-- Featured News -->
		<div class="row-fluid">
			<div class="span12">

				{% fetch top_news from article with [
							'order': 'weight desc, created desc',
							'limit': '4',
							'where': 'status = 1',
							'withTags': ['news']
				] %}

				<span><h2 style = "display:inline;"><a href="{{ 'section/news'|url }}">News</a></h2></span> <a class="pull-right blue" href="{{ 'section/news'|url }}">More News</a>
				<hr class="spacer clearfix" />
				{% set featured = top_news.shift() %}
				{% set more = top_news.shift(3) %}
				<div class="row-fluid">
					<div class="span8">
						{{ articleRender.secondary(featured) }}
					</div>
					<div class="span4">
						<hr class="spacer" />
						{% for art in more %}
							{{ articleRender.sidebar(art) }}
						{% endfor %}
					</div>
				</div>
			</div>
		</div>
		<!-- End of Featured News -->

		<hr/>

		<!-- Featured Sports -->
		<div class="row-fluid">
			<div class="span12">
				<span><h2 style = "display:inline;"><a href="{{ 'section/sports'|url }}">Sports</a></h2></span> <a class="pull-right blue" href="{{ 'section/sports'|url }}">More Sports</a>
				<hr class="spacer clearfix" />
				{% fetch top_sports from article with [
							'order': 'weight desc, created desc',
							'limit': '4',
							'where': 'status = 1',
							'withTags': ['sports']
				] %}

				{% set featured = top_sports.shift() %}
				{% set more = top_sports.shift(3) %}
				<div class="row-fluid">
					<div class="span8">
						{{ articleRender.secondary(featured) }}
					</div>
					<div class="span4">
						<hr class="spacer" />
						{% for art in more %}
							{{ articleRender.sidebar(art) }}
						{% endfor %}
					</div>
				</div>
			</div>
		</div>
		<!-- End of Featured Sports -->

		<hr/>

		<!-- Featured Mix -->
		<div class="row-fluid">
			<div class="span12">
				<span><h2 style = "display:inline;"><a href="{{ 'section/mix'|url }}">The Mix</a></h2></span> <a class="pull-right blue" href="{{ 'section/mix'|url }}">More The Mix</a>
				<hr class="spacer clearfix" />
				{% fetch top_mix from article with [
							'order': 'weight desc, created desc',
							'limit': '4',
							'where': 'status = 1',
							'withTags': ['mix']
				] %}

				{% set featured = top_mix.shift() %}
				{% set more = top_mix.shift(3) %}
				<div class="row-fluid">
					<div class="span8">
						{{ articleRender.secondary(featured) }}
					</div>
					<div class="span4">
						<hr class="spacer" />
						{% for art in more %}
							{{ articleRender.sidebar(art) }}
						{% endfor %}
					</div>
				</div>
			</div>
		</div>
		<!-- End of Featured Mix -->

		<hr/>

		<!-- Featured Viewpoints -->
		<div class="row-fluid">
			<div class="span12">
				<span><h2 style = "display:inline;"><a href="{{ 'section/viewpoints'|url }}">Viewpoints</a></h2></span> <a class="pull-right blue" href="{{ 'section/viewpoints'|url }}">More Viewpoints</a>
				<hr class="spacer clearfix" />
				{% fetch top_viewpoints from article with [
							'order': 'weight desc, created desc',
							'limit': '4',
							'where': 'status = 1',
							'withTags': ['viewpoints']
				] %}

				{% set featured = top_viewpoints.shift() %}
				{% set more = top_viewpoints.shift(3) %}
				<div class="row-fluid">
					<div class="span8">
						{{ articleRender.secondary(featured) }}
					</div>
					<div class="span4">
						<hr class="spacer" />
						{% for art in more %}
							{{ articleRender.sidebar(art) }}
						{% endfor %}
					</div>
				</div>
			</div>
		</div>
		<!-- End of Featured Viewpoints -->
		

	</div><!-- /.span8 -->

	{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}

</div><!-- /.row -->

{% endblock content %}

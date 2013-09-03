{# macros/article.tpl #}

{% macro centerpiece(article) %}
	{% import "macros/meta.tpl" as metaRender %}
	{% import "macros/disqus.tpl" as disqus %}
	{% set images = article.media.grab('type', 'image') %}

	<article class="row-fluid summarized-story">
		<div class="span12">
		{% if images.length %}
			<div style="width:100%; background-color:#cfcfcf;">
			<a href="{{ article.url }}"><img src="{{ images[0].url }}" class="article-img" style="max-height:450px;" /></a>
			</div>
			<figcaption class="bg">
				<span id="photocredit">
				  {% if images[0].authors.length %}
				    {{ images[0].authors.splat('name')|join(', ') }}
						  {% if images[0].source %}
				  	 / {{ images[0].source }}
					    {% endif %}
		  		{% endif %}
				</span>
				{{ images[0].caption }}
				<hr class="spacer clearfix" />
				<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>
				<hr class="half spacer" />
				<div class="aside mmb">
					{% if article.authors.length %}
						<span class="byline">BY: {{ article.authors.splat('name')|join(', ') }}</span>
					{% endif %}
					<span class="pull-right">
					{{ metaRender.dateLine(article.modified) }}
					</span>
				</div>
				<div class="abstract"><p>{{ article.abstract_formatted }} <a href="{{ article.url }}">Read More</a></p></div>
			</figcaption>

		{% else %}
				<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>

				<div class="aside mmb">
					{% if article.authors.length %}
						<span class="byline">BY: {{ article.authors.splat('name')|join(', ') }}</span>
					{% endif %}
					<span class="pull-right">
					{{ metaRender.dateLine(article.modified) }}
					</span>
				</div>
				<div class="abstract"><p>{{ article.abstract_formatted }} <a href="{{ article.url }}">Read More</a></p></div>

		{% endif %}


		{#{% if article.multimedia.length %}
			<ul class="mmb">
				{% for media in article.multimedia %}
				{% if media.type != 'image' %}
					{% set iconPath = 'gfn-tarheel/assets/icons/' ~ media.type ~ '.png' %}<!--what's up with the tarheel?-->
					<li><img src="{{ iconPath|url }}" alt="" />&nbsp;&nbsp;<a href="{{ media.urlMultimedia }}">{{ media.title }}</a></li>
				{% endif %}
				{% endfor %}
			</ul>
		{% endif %}#}
		</div>
	</article>
{% endmacro %}



{% macro secondary(article) %}
	{% import "macros/meta.tpl" as metaRender %}
	{% import "macros/disqus.tpl" as disqus %}
	{% set images = article.media.grab('type', 'image') %}

	<article class="row-fluid summarized-story">
		{% if images.length %}
		<div class="span12">
				<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>

				<div class="aside mmb">
					{% if article.authors.length %}
						<span class="byline">BY: {{ article.authors.splat('name')|join(', ') }}
					{% endif %}
							<div class="pull-right">
					 		{{ metaRender.dateLine(article.modified) }}
							</div>
						</span>
				</div>
			<div class="row-fluid">

				<div class="span4">
				<div style="width:100%; background-color:#cfcfcf;">
					<a href="{{ article.url }}"><img src="{{ images[0].urlPreview }}" class="article-img"  /></a>
				</div>
				</div>
				<div class="span8">
					{{ article.abstract_formatted }}
					<hr class="half spacer clearfix" />
					<div class="pull-right"><a href="{{ article.url }}" class="btn btn-primary">Read More</a></div>
					<hr class="spacer" />

					{% if images[0].caption or images[0].authors.length %}
						<div class="row-fluid">
							<div class="span12">
								<hr class="double spacer" />
								<aside>
									<strong>Left:</strong>
									{% if images[0].caption %}
										{{ images[0].caption }}
									{% endif %}
									{% if images[0].authors.length %}
										<br />
										<a href="{{ images[0].authors[0].url }}">{{ images[0].authors[0].name }}</a>
									{% endif %}
								</aside>
							</div>
						</div>
					{% endif %}
				</div>
			</div><!-- /.row-fluid -->
		</div><!-- /.span12 -->
		{% else %}

		<div class="span12">
			<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>

				<div class="aside mmb">
					{% if article.authors.length %}
						<span class="byline">BY: {{ article.authors.splat('name')|join(', ') }}
					{% endif %}
							<div class="pull-right">
							 {{ metaRender.dateLine(article.modified) }}
							</div>
						</span>
				</div>
				{{ article.abstract_formatted }}
				<hr class="half spacer clearfix" />
				<div class="pull-right"><a href="{{ article.url }}" class="btn btn-primary">Read More</a></div>
		</div>
		{% endif %}
	</article>

{% endmacro %}

{% macro sidebar(article) %}
	{% import "macros/meta.tpl" as metaRender %}

	<article class="summarized-story">
		<h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
		<div class="aside mmb">
			{% if article.authors.length %}
				<span class="byline">BY: {{ article.authors.splat('name')|join(', ') }}
			{% endif %}
			<div class="pull-right">{{ metaRender.dateLine(article.modified) }}</div>
				</span>
		</div>
	</article>
	<hr class="double spacer"/>
{% endmacro %}

{% macro topSidebar(article) %}
	{% import "macros/meta.tpl" as metaRender %}

	<article class="summarized-story">
		<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>
		<div class="aside mmb">
			{% if article.authors.length %}
				<span class="byline">BY: {{ article.authors.splat('name')|join(', ') }}
			{% endif %}
			<div class="pull-right">{{ metaRender.dateLine(article.modified) }}</div>
				</span>
		</div>
		<div class="abstract"><p>{{ article.abstract_formatted }} <a href="{{ article.url }}">Read More</a></p></div>
	</article>
	<hr class="double spacer"/>
{% endmacro %}

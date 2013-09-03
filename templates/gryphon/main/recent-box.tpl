{# gryphon/main/recent-box.tpl#}

{% helper disqusPopular as popular %}

{% fetch recent from article with[
	'order':'created desc'
]%}

<div class="accordion" id="popular-box">
	<div class="accordion-group">
		<header class="recent">
			<h3><a class="accordion-toggle" data-toggle="collapse" data-parent="#popular-box" href="#collapseOne">
				<i id="popular-accordion" class="icon-white icon-minus"></i> Recent Stories
			</a></h3>
		</header>
		<div id="collapseOne" class="accordion-body collapse in">
			<div class="accordion-inner box mb bg" style="border:0px;">
				<ul>
					{% for item in recent|shift(5) %}
						{#{% if not 'tdg.thesn'|in(item.url) %}#}
							<li><h5><a href="{{ item.url }}">{{ item.title }}</a>&nbsp;<span class="aside2">| <strong>{{ item.posts|int2noun('comment') }}</strong></span></h5></li>
						{#{% endif %}#}
					{% endfor %}
				</ul>
			</div>
		</div>
	</div>
	<div class="accordion-group">
		<header class="recent">
			<h3><a class="accordion-toggle" data-toggle="collapse" data-parent="#popular-box" href="#collapseTwo">
				<i id="recent-accordion" class="icon-white icon-plus"></i> Recent Comments
			</a></h3>
		</header>
		<div id="collapseTwo" class="accordion-body collapse">
			<div class="accordion-inner box mb bg" style="border:0px;">
				<ul>
					{% for item in popular.posts|shift(5) %}
						<li>{{ item.author.name }} said: <p class="copy" style="margin:0;padding:0;">{{ item.raw_message|clip(50) }}</p><div class="smaller">on <a href="{{ item.thread.link }}">{{ item.thread.title }}</a></div><hr class="spacer" /></li>
					{% endfor %}
				</ul>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	setTimeout(function() {
		$(function() {
			$(".accordion-group").on("shown", function(){
				$("i", this).removeClass("icon-plus");
				$("i", this).addClass("icon-minus");
			});
			$(".accordion-group").on("hidden", function(){
				$("i", this).removeClass("icon-minus");
				$("i", this).addClass("icon-plus");
			});
		});
	}, 1000);
</script>

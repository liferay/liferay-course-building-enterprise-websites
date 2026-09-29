<style>
	.clarity-bento .card {
		background-color: var(--color-brand-secondary-lighten-6);
		border: 0;
		border-radius: var(--card-border-radius);
		overflow: hidden;
	}

	.clarity-bento .card-img-top {
		height: 25rem;
		object-fit: cover;
	}

	.clarity-bento .card-body {
		padding: var(--spacer-6) var(--spacer-4);
	}

	.clarity-bento .card-title {
		font-size: var(--h2-font-size);
	}

	.clarity-bento .card-title,
	.clarity-bento .card-body p {
		margin-bottom: var(--spacer-3);
	}
</style>

<#if entries?has_content>
	<#assign
		categoryImages = {
			"Contacts": "/documents/d/asset-library-32687/contacts",
			"Eyeglasses": "/documents/d/asset-library-32687/eyeglasses",
			"Lenses": "/documents/d/asset-library-32687/lenses",
			"Sunglasses": "/documents/d/asset-library-32687/sunglasses"
		}
		categoryOrder = ["Eyeglasses", "Sunglasses", "Contacts", "Lenses"]
		orderedCategories = []
		widths = [8, 4, 4, 8]
	/>

	<#list categoryOrder as orderName>
		<#list entries as entry>
			<#if entry.getName() == orderName>
				<#assign orderedCategories = orderedCategories + [entry] />
			</#if>
		</#list>
	</#list>

	<#list entries as entry>
		<#if !categoryOrder?seq_contains(entry.getName())>
			<#assign orderedCategories = orderedCategories + [entry] />
		</#if>
	</#list>

	<div class="clarity-bento row">
		<#list orderedCategories as currentCategory>
			<#assign
				categoryHref = cpAssetCategoriesNavigationDisplayContext.getFriendlyURL(currentCategory.getCategoryId(), themeDisplay)
				categoryName = currentCategory.getTitle(locale)
				description = currentCategory.getDescription(locale)
				imageSrc = categoryImages[currentCategory.getName()]!""
			/>

			<div class="col-lg-${widths[currentCategory?index % 4]} mb-4">
				<div class="card h-100">
					<#if imageSrc?has_content>
						<img alt="${categoryName}" class="card-img-top" src="${imageSrc}" />
					</#if>

					<div class="card-body">
						<h3 class="card-title">${categoryName}</h3>

						<#if description?has_content>
							<p>${htmlUtil.stripHtml(description)}</p>
						</#if>

						<a class="btn btn-primary btn-sm" href="${categoryHref}">Explore</a>
					</div>
				</div>
			</div>
		</#list>
	</div>
</#if>

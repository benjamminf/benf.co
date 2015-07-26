<?php

namespace Craft;

class UtilitiesTwigExtension extends \Twig_Extension
{

	public function getName()
	{
		return Craft::t('Utilities');
	}
  
	public function getFilters()
	{
		return array(
			'inlineSvg' => new \Twig_Filter_Method($this, 'inlineSvg'),
		);
	}

	public function getTests()
	{
		return array(
			'boolean' => new \Twig_Test_Method($this, 'isBoolean'),
			'string' => new \Twig_Test_Method($this, 'isString'),
		);
	}

	public function inlineSvg($asset, $width = 'auto', $height = 'auto')
	{
		$charset = craft()->templates->getTwig()->getCharset();
		$url = $asset instanceof AssetFileModel ? $asset->getUrl() : $asset;
		// TODO remove localhost
		$source = file_get_contents('http://localhost' . $url);

		$matches = array();
		$success = preg_match('/\\<svg[\\s\\S]+\\<\\/svg\\>/im', $source, $matches);

		if($success)
		{
			$source = $matches[0];
			$svgWidth = null;
			$svgHeight = null;
			
			if($width != 'auto')
			{
				$source = preg_replace_callback('/width="([0-9]+)/im', function($matches) use($width, &$svgWidth)
				{
					$svgWidth = (float) $matches[1];
					return 'width="' . $width;
				}, $source, 1);

				if($height == 'auto')
				{
					$ratio = $width / $svgWidth;

					$source = preg_replace_callback('/height="([0-9]+)/im', function($matches) use($ratio)
					{
						$height = (float) $matches[1];
						return 'height="' . ($height * $ratio);
					}, $source, 1);
				}
			}

			if($height != 'auto')
			{
				$source = preg_replace_callback('/height="([0-9]+)/im', function($matches) use($height, &$svgHeight)
				{
					$svgHeight = (float) $matches[1];
					return 'height="' . $height;
				}, $source, 1);

				if($width == 'auto')
				{
					$ratio = $height / $svgHeight;

					$source = preg_replace_callback('/width="([0-9]+)/im', function($matches) use($ratio)
					{
						$width = (float) $matches[1];
						return 'width="' . ($width * $ratio);
					}, $source, 1);
				}
			}
		}

		return new \Twig_Markup($success ? $source : '', $charset);
	}

	public function isBoolean($value)
	{
		return is_bool($value);
	}

	public function isString($value)
	{
		return is_string($value);
	}
}

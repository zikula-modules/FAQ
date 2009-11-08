<?php
/**
 * Zikula Application Framework
 *
 * @copyright (c) 2002, Zikula Development Team
 * @link http://www.zikula.org
 * @version $Id$
 * @license GNU/GPL - http://www.gnu.org/copyleft/gpl.html
 * @package Zikula_Value_Addons
 * @subpackage FAQ
 */

$dom = ZLanguage::getModuleDomain('FAQ');
$modversion['name']           = 'FAQ';
$modversion['displayname']    = __('FAQ', $dom);
$modversion['url']            = __('faq', $dom);
$modversion['description']    = __('Frequently Asked Questions', $dom);
$modversion['version']        = '2.3';
$modversion['changelog']      = 'pndocs/changelog.txt';
$modversion['credits']        = 'pndocs/credits.txt';
$modversion['help']           = 'pndocs/help.txt';
$modversion['license']        = 'pndocs/license.txt';
$modversion['official']       = 1;
$modversion['author']         = 'Mark West';
$modversion['contact']        = 'http://www.markwest.me.uk/';
$modversion['securityschema'] = array('FAQ::' => 'FAQ ID::');

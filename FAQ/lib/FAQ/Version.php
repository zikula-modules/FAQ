<?php
/**
 * Zikula Application Framework
 *
 * @copyright (c) 2002, Zikula Development Team
 * @link http://www.zikula.org
 * @license GNU/GPL - http://www.gnu.org/copyleft/gpl.html
 * @package Zikula_Value_Addons
 * @subpackage FAQ
 */

class FAQ_Version extends Zikula_Version
{
    public function getMetaData()
    {

        $meta = array();
        $meta['displayname']    = $this->__('FAQ');
        $meta['description']    = $this->__('Frequently Asked Questions');
        $meta['version']        = '2.3.2';
        //! this defines the module's url
        $meta['url']            = $this->__('faq');

        $meta['securityschema'] = array('FAQ::' => 'FAQ ID::');
        return $meta;
    }
}
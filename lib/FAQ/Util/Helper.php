<?php

/**
 * Zikula Application Framework
 *
 * @copyright (c) 2002-2013, Zikula Development Team
 * @link http://www.zikula.org
 * @license GNU/GPL - http://www.gnu.org/copyleft/gpl.html
 * @package Zikula_Value_Addons
 * @subpackage FAQ
 */

/**
 * Utility implementation class for helper methods.
 */
class FAQ_Util_Helper
{
    /**
     * this method is sending an email to the admin mail adress
     * if an user that is not in the admin gruop has entered a question
     *
     * @param string $question
     * @param int $uid user id
     */
    public function sendMessage($question, $uid, $submittedBy)
    {
        $dom = ZLanguage::getModuleDomain('FAQ');

        $question = nl2br($question);
         
        $transport = Swift_MailTransport::newInstance();
        $mailer = Swift_Mailer::newInstance($transport);
         
        $message = Swift_Message::newInstance();
         
        $message->setSubject(__('A new question was entered on site by an user!', $dom));
        $toMail = ModUtil::getVar('ZConfig', 'adminmail');
        // get user datas
        $userDatas = $this->getUserDatas($uid);
        // if a guest has entered his name
        if ($submittedBy != '') {
            $userName = $submittedBy;
        } else {
            // else we take the name by datas if user is loggedIn
            // or we call him guest
            $userName = $userDatas[0];
        }

        // if user name is not empty we take the data
        if ($userName != '') {
            $userText = __('The user', $dom) . ' ' . $userName;
        }
        // else we call him guest only
        else {
            $userText = __('A guest' , $dom);
        }
        $userMail = $userDatas[1];
        // set from mail
        $message->setFrom($userMail);
        // build array of to adresses
        $addresses = array($toMail);
        // set to adress
        $message->setTo($addresses);
        // set standard body for message
        $message->setBody(__('A new question was sent!' . ' ', $dom));
        // add html body for message

        // we build the link to admin panel of FAQ
        $link = System::getHomepageUrl();
        $link .= ModUtil::url('FAQ', 'admin', 'view');
        $url = '<a href="';
        $url .= $link;
        $url .= '" />';
        $url .= $link;
        $url .= '</a>';
        $message->addPart('<h2>' . __('There is a new question' . '</h2>' . $userText . ' ' . __('entered the following question') . ':<br /><br />' . $question, $dom) . '<br /><br />' . __('Go to admin area to answer the question:') . '<br />' . $url , "text/html");
         
        // sent message and if success give message to the user
        if ($mailer->send($message) > 0) {
            LogUtil::registerStatus(__('Your question was sent to our support', $dom));
        }
    }

    /**
     *
     * @param int $uid user id
     * @return return boolean , true if user is in admingroup otherwise false
     */
    public function isInAdminGroup($uid)
    {         
        $groupIds = UserUtil::getGroupsForUser($uid);
        if (in_array(2, $groupIds)) {
            return true;
        }
        else {
            return false;
        }
    }

    /**
     *
     * @param int $uid user id
     * @return array username and user mail adress
     */
    public function getUserDatas($uid)
    {
        if ($uid > 2) {
            $uname = UserUtil::getVar('uname', $uid);
            $umail = UserUtil::getVar('email', $uid);
            return array($uname, $umail);
        }
        else {
            return array('', ModUtil::getVar('ZConfig', 'adminmail'));
        }
    }
}

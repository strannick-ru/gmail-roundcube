<?php
$config = array();
$config['db_dsnw'] = 'sqlite:////var/www/db/sqlite.db';
$config['db_persistent'] = true;

$config['default_host'] = 'imapproxy';
$config['default_port'] = 143;

$config['smtp_server'] = 'smtp.gmail.com';
$config['smtp_port'] = 465;
$config['smtp_user'] = '%u';
$config['smtp_pass'] = '%p';

$config['ip_check'] = true;
$config['des_key'] = '6592f9c58acb2b821ba826fe';
$config['product_name'] = 'GMail Webmail';

$config['plugins'] = array(
    'acl',
    'additional_message_headers',
    'attachment_reminder',
    'carddav',
    'contextmenu',
    'filesystem_attachments',
    'hide_blockquote',
    'identity_select',
    'jqueryui',
    'keyboard_shortcuts',
    'newmail_notifier',
    'persistent_login',
    'zipdownload');

$config['spellcheck_engine'] = 'pspell';
$config['date_format'] = 'd.m.Y';
$config['upload_progress'] = true;
$config['layout'] = 'widescreen';
$config['inline_images'] = true;

$config['default_charset'] = 'UTF-8';
$config['skin'] = 'chameleon-blue';
$config['show_images'] = 2;
$config['htmleditor'] = 4;
$config['check_all_folders'] = true;
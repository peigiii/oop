<?php
/* 简单安全的 phpMyAdmin 配置 */

$cfg['blowfish_secret'] = 'H4rDt0Gu3sS123!'; // 用于 cookie 加密的随机字符串

$i = 0;
$i++;
$cfg['Servers'][$i]['auth_type'] = 'cookie';  // 登录方式
$cfg['Servers'][$i]['host'] = 'skillspheredb.mysql.database.azure.com';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = false;
?>


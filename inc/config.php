<?php
/*!
 * Base Framework 1.03
 * 
 * Attribution-NonCommercial-ShareAlike 3.0
 * http://creativecommons.org/licenses/by-nc-sa/3.0/
 * 
 * Base Framework by Horacio González Diéguez
 * is licensed under a Creative Commons based on a work at
 * https://github.com/horaciogd/Base-Framework
 * Date: Fri Jan 02 2015
 *
 * Current code by Horacio González Diéguez and Emanuele Mazza
 * Date: Mon Feb 23 2015
 * 
 * enjoy the code and drop us a line for comments and questions!
 * horaciogd at vhplab dot net / n3m3da at d3cod3 dot org
 *
 */
 
/* DATABASE INFORMATION */

$auth_key = 'your_auth_key_here'; // ex. "3407P)N(/=<84uhtpoim34587pq9,¨Pom`k0xr8p39)"

$db = array(
	"type" => "mysql",
	"host" => "localhost",
	"data" => "your_DB",
	"user" => "your_user",
	"pass" => "your_password"
);

$table_prefix  = 'vhp_d3_streaming_';

$db_tables = array(
	"user" => $table_prefix."user",
	"data" => $table_prefix."data",
	"stored_data" => $table_prefix."stored_data"
);

/* Global variables */
$root = "your web root"; // ex. "http://www.yourdomain.xxx"


?>
<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Methods: DELETE");
header("Access-Control-Allow-Methods: PATCH");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$method = $_SERVER['REQUEST_METHOD'];

include_once "../entity/provider.php";
$provider = new Provider();
$id = (isset($_GET['id'])) ? intval($_GET['id']) : '';

switch ($method):
    case "GET": {
        if (!empty($id)) {
            $provider->getById($id);
        } else {
            $provider->getAll();
        }
        break;
    }
    case "POST": {
        $provider->create();
        break;
    }
    case "PUT": {
        if (!empty($id)) {
            $provider->update($id);
        }
        break;
    }
    case "DELETE": {
        if (!empty($id)) {
            $provider->delete($id);
        }
        break;
    }
endswitch;
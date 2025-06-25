<?php 

namespace App\Controllers;



use App\Models\Articles;
use App\Models\Cities;
use \Core\View;
use Exception;


/**
 * Contact controller
 */
class Contact extends \Core\Controller {
    //TODO: rendre le formulaire fonctionnel en configurant le SMTP et en ajoutant une action sendMailAction
    /**
     * Affiche le formulaire de contact
     *
     * @return void
     * @throws \Exception
     */
    public function showAction() {
     
        View::renderTemplate("Contact/show.html");
    }
}
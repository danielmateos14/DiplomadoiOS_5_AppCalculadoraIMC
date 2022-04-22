//
//  PantallaIMCViewController.swift
//  5AppIMC
//
//  Created by djdenielb on 11/04/22.
//

import UIKit

class PantallaIMCViewController: UIViewController{

//    Variables graficas de la segunda vista
    @IBOutlet weak var labelResultado: UILabel!
    @IBOutlet weak var labelLeyenda: UILabel!
    @IBOutlet weak var imgPeso: UIImageView!
    @IBOutlet var viewSegundaPantalla: UIView!
//    Esta variable es la que recibe el objeto de pantalla anterior y se pone como opcionla por que exige una inicializacion
    var variableRecibeDatos: BaseObjetosIMC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Aqui accedemos al elemento grafico primero y le decimos que es igual a y llamamos a nuestra variable que recibe los datos que en este caso es un objeto y luego con el . accedemos a los atributos uno por uno y solo se los ponemos en cada caso
        viewSegundaPantalla.backgroundColor = variableRecibeDatos?.color
        labelResultado.text = variableRecibeDatos?.resultado
        labelLeyenda.text = variableRecibeDatos?.mensaje
        imgPeso.image = variableRecibeDatos?.imagen
        
        
    }
    
}

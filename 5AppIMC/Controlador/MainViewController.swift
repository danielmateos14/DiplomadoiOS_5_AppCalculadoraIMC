//
//  ViewController.swift
//  5AppIMC
//
//  Created by djdenielb on 08/04/22.
//

import UIKit



class MainViewController: UIViewController {

//    Variables de los elementos graficos
    @IBOutlet weak var labelPeso: UILabel!
    @IBOutlet weak var labelEstatura: UILabel!
    @IBOutlet weak var sliderPeso: UISlider!
    @IBOutlet weak var sliderEstatura: UISlider!
//    Instancia del struct cerebro
    let cerebroIMC = CerebroIMC()
    
//    Variables peso y estatura para enviarlas al cerebro
    var peso: Float = 0.0
    var estatura: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//    Action del slider peso, se le pone la variable peso y con sender.value le dice que tome el valor de peso cada que se mueva y luego en label peso lo muestra con % es para los decimales
    @IBAction func sliderPeso(_ sender: UISlider) {
        peso = sender.value
        labelPeso.text = "\(String(format: "%.1f", peso)) kg"
    }
    
//    Action del slider estatura, se le pone la variable estatura y con sender.value le dice que tome el valor de peso cada que se mueva y luego en label peso lo muestra con % es para los decimales
    @IBAction func sliderEstatura(_ sender: UISlider) {
        estatura = sender.value
        labelEstatura.text = "\(String(format: "%.2f", estatura)) m"
    }

//    Action del boton calcular con el segue para preparar a la vista para enviar los datos a la segunda vista
    @IBAction func botonCalcular(_ sender: UIButton) {
        performSegue(withIdentifier: "SegueSegundaPantalla", sender: self)
    }
    
//    Aqui se envian los datos se hace if que identifica que sea el mismo nombre del segue, despues se crea dentro del if una variable que con el . ya tendra acceso a todo lo de la segunda pantalla, en la segunda pantalla se crea una variable que recibira los datos, en este caso le estamos enviando la funcion de imc que esta en cerebro y esta retorna un objeto entonces lo que se enviara sera un objeto
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueSegundaPantalla"{
        let variablesSegundaPantalla = segue.destination as! PantallaIMCViewController
            variablesSegundaPantalla.variableRecibeDatos = cerebroIMC.Imc(recibePeso: peso, recibeEstatura: estatura)
        }
    }
    
//    Esta es para cuando se regresa es el unwind segue, al presionar el boton que indicamos en el unwind segue, se hara lo que esta dentro del if, este if no tiene una variable por que no la vamos usar, si no , se pone la variable como el mismo nombre de la funcion que seria btnVolverACalcular y se pone el segue source en lugar de identifier y luego is as? y el nombre de la segunda pantalla
//    - Aqui dentro del if solo puse todos los valores a cero para que haga un reset de la app
    @IBAction func btnVolverACalcular(segue: UIStoryboardSegue){
        if segue.source is PantallaIMCViewController{
            labelPeso.text = "0 kg"
            labelEstatura.text = "0 m"
            sliderPeso.value = 0.0
            sliderEstatura.value = 0.0
            peso = 0.0
            estatura = 0.0
        }
    }
    
    
}


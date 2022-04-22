//
//  IMC.swift
//  5AppIMC
//
//  Created by djdenielb on 11/04/22.
//

import Foundation
import UIKit

//Instancia baseObjetos IMC, con valores por default
var baseObjetosIMC = BaseObjetosIMC(resultado: "No hay datos", mensaje: "No Ingresaste ningun valor", imagen: UIImage(systemName: "person")!, color: UIColor.white)

//Estructura cerebro donde iran las funciones
struct CerebroIMC{
//    Esta funcion va a calcular el imc recibe un peso y una estatura, si el peso y la estatura son 0 muestra los valores por default, despues hace la operacion y despues entra un if dependiendo del peso crea un objeto y lo modifica para mostrar diferentes resultados, al final retorna el objeto ya con los datos cambiados
    func Imc(recibePeso: Float, recibeEstatura: Float) -> BaseObjetosIMC{
        let peso = recibePeso
        let estatura = recibeEstatura
        if peso == 0.0 && estatura == 0.0{
            baseObjetosIMC = BaseObjetosIMC(resultado: "No hay datos", mensaje: "No Ingresaste ningun valor", imagen: UIImage(systemName: "person")!, color: UIColor.white)
        }
        let resultadoIMC = peso/(estatura*estatura)
        if resultadoIMC < 18.5{
            baseObjetosIMC = BaseObjetosIMC.init(resultado: "\(String(format: "%.2f", resultadoIMC ))", mensaje: "Esta muy bajo de peso, deberias acudir al medico", imagen: UIImage(named: "flaco") ?? UIImage(systemName: "xmark.octagon.fill")!, color: UIColor.systemPink)
        }else if resultadoIMC < 24.9{
            baseObjetosIMC = BaseObjetosIMC.init(resultado: "\(String(format: "%.2f", resultadoIMC ))", mensaje: "Estas en tu peso normal !! Excelente !!", imagen: UIImage(named: "normal") ?? UIImage(systemName: "xmark.octagon.fill")!, color: UIColor.systemYellow)
        }else if resultadoIMC < 29.9{
            baseObjetosIMC = BaseObjetosIMC.init(resultado: "\(String(format: "%.2f", resultadoIMC ))", mensaje: "Estas pasandote de tacos bajale a la dieta T", imagen: UIImage(named: "sobrepeso") ?? UIImage(systemName: "xmark.octagon.fill")!, color: UIColor.systemCyan)
        }else if resultadoIMC > 30{
            baseObjetosIMC = BaseObjetosIMC.init(resultado: "\(String(format: "%.2f", resultadoIMC ))", mensaje: "Estas en problemas, estas a punto de colapsar", imagen: UIImage(named: "obesidad") ?? UIImage(systemName: "xmark.octagon.fill")!, color: UIColor.systemTeal)
        }
        return baseObjetosIMC
    }
    
}


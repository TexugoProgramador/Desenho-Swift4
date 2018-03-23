//
//  ViewController.swift
//  Desenho
//
//  Created by Humberto Puccinelli on 19/03/2018.
//  Copyright © 2018 Humberto Puccinelli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewDesenho: UIView!
    @IBOutlet weak var selecionaVermelho: UISlider!
    @IBOutlet weak var selecionaVerde: UISlider!
    @IBOutlet weak var selecionaAzul: UISlider!
    @IBOutlet weak var selecionaOpacidade: UISlider!
    @IBOutlet weak var selecionaTamanho: UISlider!
    
    var path = UIBezierPath()
    var pontoIncio = CGPoint()
    var pontoAtual = CGPoint()
    
    var vermelho: CGFloat = 0.5
    var verde: CGFloat = 0.5
    var azul: CGFloat = 0.5
    var tamanho: CGFloat = 1.0
    var opacidade: CGFloat = 1.0
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewDesenho.clipsToBounds = true
        viewDesenho.isMultipleTouchEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            path.removeAllPoints()
            pontoIncio = touch.location(in: self.view)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //chamar a função do ponto inicial e do ponto final
        if let touch = touches.first {
            pontoAtual = touch.location(in: self.view)
        }
        
        path.move(to: pontoIncio)
        path.addLine(to: pontoAtual)
        pontoIncio = pontoAtual
        draw()
    }
 
    func draw(){
        let linha =  CAShapeLayer()
        linha.fillColor = nil
        linha.strokeColor = UIColor(red: vermelho, green: verde, blue: azul, alpha: opacidade).cgColor
        linha.lineWidth = tamanho
        linha.path = path.cgPath
        viewDesenho.layer.addSublayer(linha)
        viewDesenho.setNeedsDisplay()
        
    }

    @IBAction func Limpar(_ sender: UIButton) {
        path.removeAllPoints()
        viewDesenho.layer.sublayers = nil
        viewDesenho.setNeedsDisplay()
    }
    
    @IBAction func mudaParametro(_ sender: UISlider) {
        
        vermelho = CGFloat(selecionaVermelho.value)
        verde = CGFloat(selecionaVerde.value)
        azul = CGFloat(selecionaAzul.value)
        
        opacidade = CGFloat(selecionaOpacidade.value)
        tamanho = CGFloat(selecionaTamanho.value)
        
    }
    
}


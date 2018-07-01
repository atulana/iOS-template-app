//
//  DiscoverBikesVC.swift
//  iOSTemplateApp
//
//  Created by Pranav V K on 6/24/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit

class DiscoverBikesVC: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //MARK:- IBOutlets
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var durationPicker: UIPickerView!
    @IBOutlet weak var noOfBikesPicker: UIPickerView!
    @IBOutlet weak var selectPickDateBtn: UIButton!
    @IBOutlet weak var selectDurationBtn: UIButton!
    @IBOutlet weak var selectDateLbl: UILabel!
    @IBOutlet weak var selectDurationLbl: UILabel!
    @IBOutlet weak var selectNoOfBikesBtn: UIButton!
    @IBOutlet weak var selectBikeLbl: UILabel!
    
    @IBOutlet weak var optionWithRidingGearsBtn: UIButton!
    @IBOutlet weak var roadOptionBtn: UIButton!
    @IBOutlet weak var mountianOptionBtn: UIButton!
    @IBOutlet weak var bmxOptionBtn: UIButton!
    @IBOutlet weak var crossCountryOptionBtn: UIButton!
    
    //MARK:- Variables
    var isDatePickerShown = false
    var isDurationPickerShown = false
    var isBikesPickerShown = false
    
    var durationArray = Array(1...48)
    var noOfBikesArray = Array(1...20)
    
    var isGearsSearchEnabled = false
    var isRoadOptionEnabled = false
    var isMountianOptionEnabled = false
    var isBMXOptionEnabled = false
    var isCrossCountryOptionEnabled = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.setupDiscoverBikesVC()
        
        let tappGuester = UITapGestureRecognizer()
        tappGuester.addTarget(self, action: #selector(handleTouchEvent) )
        self.view.addGestureRecognizer(tappGuester)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Custom Methods
    func setupDiscoverBikesVC()
    {
        
        self.datePickerView.isHidden = true
        self.durationPicker.isHidden = true
        self.noOfBikesPicker.isHidden = true
        
        // get the current date and time
        let currentDateTime = Date()
        
        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        
        // get the date time String from the date object
        self.selectPickDateBtn.setTitle(formatter.string(from: currentDateTime), for: .normal)
        
        self.selectDurationBtn.setTitle("1 Hrs", for: .normal)
        self.selectNoOfBikesBtn.setTitle("2 Bikes", for: .normal)
        
        self.selectNoOfBikesBtn.addBottomBorder(.gray, height: 1.0)
        self.selectDurationBtn.addBottomBorder(.gray, height: 1.0)
        self.selectPickDateBtn.addBottomBorder(.gray, height: 1.0)
        
      
        self.optionWithRidingGearsBtn.setImage(UIImage(named: ""), for: .normal)
        self.roadOptionBtn.setImage(UIImage(named: ""), for: .normal)
        self.bmxOptionBtn.setImage(UIImage(named: ""), for: .normal)
        self.crossCountryOptionBtn.setImage(UIImage(named: ""), for: .normal)
         self.mountianOptionBtn.setImage(UIImage(named: ""), for: .normal)
        
        addRectBorder(control: optionWithRidingGearsBtn, color: UIColor.gray.cgColor, width: 1)
        addRectBorder(control: roadOptionBtn, color: UIColor.gray.cgColor, width: 1)
        addRectBorder(control: bmxOptionBtn, color: UIColor.gray.cgColor, width: 1)
        addRectBorder(control: crossCountryOptionBtn, color: UIColor.gray.cgColor, width: 1)
        addRectBorder(control: mountianOptionBtn, color: UIColor.gray.cgColor, width: 1)
        
    }
    
    func addRectBorder(control : UIView , color : CGColor, width : Float)
    {
        control.layer.borderColor = color
        control.layer.borderWidth = CGFloat(width)
    }
    
    @objc func handleTouchEvent()
    {
        if isDatePickerShown {
            isDatePickerShown = false
            datePickerView.isHidden = true
        }
        
        if isDurationPickerShown {
            isDurationPickerShown = false
            durationPicker.isHidden = true
        }
        
        if isBikesPickerShown {
            isBikesPickerShown = false
            noOfBikesPicker.isHidden = true
        }
        
    }
    
    //MARK:- PickerView Delegate Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.restorationIdentifier == "durationPicker" {
            return durationArray.count
        }
        else if pickerView.restorationIdentifier == "bikesPicker" {
            return noOfBikesArray.count
        }
        else {
            return 0
        }
    }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.restorationIdentifier == "durationPicker" {
            return "\(durationArray[row])"
        }
        else if pickerView.restorationIdentifier == "bikesPicker" {
            return "\(noOfBikesArray[row])"
        }
        else {
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.restorationIdentifier == "durationPicker" {
            selectDurationBtn.setTitle("\(durationArray[row]) Hrs", for: .normal)
             isDurationPickerShown = false
        }
        else if pickerView.restorationIdentifier == "bikesPicker" {
            selectNoOfBikesBtn.setTitle("\(noOfBikesArray[row]) Bikes", for: .normal)
             noOfBikesPicker.isHidden = true
        }
        pickerView.isHidden = true
    }
    
    //MARK:- IBAction Methods
    @IBAction func selectPickDateBtnTapped(_ sender: UIButton) {
        if isDurationPickerShown {
            selectDurationBtnTapped(UIButton())
        }
        
        if isBikesPickerShown {
            selectNoOfBikesBtnTapped(UIButton())
        }
        
        if !isDatePickerShown {
             isDatePickerShown = true
             datePickerView.isHidden = false
        }
        else {
             isDatePickerShown = false
             datePickerView.isHidden = true
        }
    }
    
    @IBAction func selectDurationBtnTapped(_ sender: UIButton) {
        if isDatePickerShown {
            selectPickDateBtnTapped(UIButton())
        }
        
        if isBikesPickerShown {
            selectNoOfBikesBtnTapped(UIButton())
        }
        
        if !isDurationPickerShown {
            isDurationPickerShown = true
            durationPicker.isHidden = false
        }
        else {
            isDurationPickerShown = false
            durationPicker.isHidden = true
        }
    }
    
    @IBAction func selectNoOfBikesBtnTapped(_ sender: UIButton) {
        if isDatePickerShown {
            selectPickDateBtnTapped(UIButton())
        }
        
        if isDurationPickerShown {
            selectDurationBtnTapped(UIButton())
        }
        
        if !isBikesPickerShown {
            isBikesPickerShown = true
            noOfBikesPicker.isHidden = false
        }
        else {
            isBikesPickerShown = false
            noOfBikesPicker.isHidden = true
        }
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        
        // get the date time String from the date object
        self.selectPickDateBtn.setTitle(formatter.string(from: sender.date), for: .normal)
    }
    
    @IBAction func searchWithGearsOptionTapped(_ sender: UIButton) {
        if !self.isGearsSearchEnabled {
             self.optionWithRidingGearsBtn.setImage(UIImage(named: "checkbox-icon"), for: .normal)
            self.isGearsSearchEnabled = true
            addRectBorder(control: self.optionWithRidingGearsBtn, color: UIColor.white.cgColor, width: 0)
        }
        else {
            self.optionWithRidingGearsBtn.setImage(UIImage(named: ""), for: .normal)
            self.isGearsSearchEnabled = false
            addRectBorder(control: self.optionWithRidingGearsBtn, color: UIColor.gray.cgColor, width: 1)
        }
    }
    
    @IBAction func roadOptionBtnTapped(_ sender: UIButton) {
        if !self.isRoadOptionEnabled {
            self.roadOptionBtn.setImage(UIImage(named: "checkbox-icon"), for: .normal)
            self.isRoadOptionEnabled = true
            addRectBorder(control: self.roadOptionBtn, color: UIColor.white.cgColor, width: 0)
        }
        else {
            self.roadOptionBtn.setImage(UIImage(named: ""), for: .normal)
            self.isRoadOptionEnabled = false
            addRectBorder(control: roadOptionBtn, color: UIColor.gray.cgColor, width: 1)
        }
    }
    
    @IBAction func mountianOptionBtnTapped(_ sender: UIButton) {
        if !self.isMountianOptionEnabled {
            self.mountianOptionBtn.setImage(UIImage(named: "checkbox-icon"), for: .normal)
            self.isMountianOptionEnabled = true
            addRectBorder(control: self.mountianOptionBtn, color: UIColor.white.cgColor, width: 0)
        }
        else {
            self.mountianOptionBtn.setImage(UIImage(named: ""), for: .normal)
            self.isMountianOptionEnabled = false
            addRectBorder(control: mountianOptionBtn, color: UIColor.gray.cgColor, width: 1)
        }
    }
    
    @IBAction func crossCountryOptionTapped(_ sender: UIButton) {
        if !self.isCrossCountryOptionEnabled {
            self.crossCountryOptionBtn.setImage(UIImage(named: "checkbox-icon"), for: .normal)
            self.isCrossCountryOptionEnabled = true
            addRectBorder(control: self.crossCountryOptionBtn, color: UIColor.white.cgColor, width: 0)
        }
        else {
            self.crossCountryOptionBtn.setImage(UIImage(named: ""), for: .normal)
            self.isCrossCountryOptionEnabled = false
            addRectBorder(control: self.crossCountryOptionBtn, color: UIColor.gray.cgColor, width: 1)
        }
    }
    
    @IBAction func bmxOptionTapped(_ sender: UIButton) {
        if !self.isBMXOptionEnabled {
            self.bmxOptionBtn.setImage(UIImage(named: "checkbox-icon"), for: .normal)
            self.isBMXOptionEnabled = true
            addRectBorder(control: bmxOptionBtn, color: UIColor.white.cgColor, width: 0)
        }
        else {
            self.bmxOptionBtn.setImage(UIImage(named: ""), for: .normal)
            self.isBMXOptionEnabled = false
            addRectBorder(control: bmxOptionBtn, color: UIColor.gray.cgColor, width: 1)
        }
    }
    
}

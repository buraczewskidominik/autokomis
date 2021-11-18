//
//  Localizable.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 07/08/2021.
//

import Foundation

enum Localizable {
    
    enum Splash {
        static let title = "Autokomis"
    }
    
    enum Welcome {
        static let welcome = "Witaj!"
        static let signUp = "Rejestracja komisu"
        static let logIn = "Logowanie jako komis"
        static let or = "lub"
        static let continueBuying = "Kupuj auta"
    }
    
    enum SignUp {
        static let signUpTitle = "Rejestracja"
        static let businessName = "Nazwa sprzedającego"
        static let firstName = "Imię"
        static let lastName = "Nazwisko"
        static let phone = "Telefon"
        static let email = "Email"
        static let password = "Hasło"
        static let confirmPassword = "Potwierdź hasło"
        static let signUp = "Zarejestruj się"
    }
    
    enum LogIn {
        static let logInTitle = "Logowanie"
        static let email = "Email"
        static let password = "Hasło"
        static let logIn = "Zaloguj się"
    }
    
    enum Common {
        enum SellersCars {
            static let addCar = "Dodaj nowe auto"
        }
        
        enum CarDetails {
            static let specification = "Specyfikacja"
            static let make = "Marka"
            static let model = "Model"
            static let year = "Rocznik"
            static let petrolType = "Rodzaj paliwa"
            static let milage = "Przebieg"
            static let cylinderCapacity = "Pojemność skokowa [cm3]"
            static let power = "Moc [KM]"
            static let notDamagedNow = "Nieuszkodzony"
            static let noAccidents = "Bezwypadkowy"
            static let hasPlates = "Ma tablice rejestracyjne"
            static let description = "Opis"
        }
    }
    
    enum SellerProfile {
        static let editProfile = "Edytuj profil"
    }
    
    enum EditSellerProfile {
        static let save = "Zapisz"
        static let back = "Cofnij"
    }
}

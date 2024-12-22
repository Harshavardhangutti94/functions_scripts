#!/bin/bash 

function func1 {
    echo " This is Function-1" 
    func2
}

func2() { 
    echo " This is Function-2" 
}


func1 
func2

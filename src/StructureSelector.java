import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.util.*;

public class StructureSelector {


    public static void main (String[] args){  
	JFrame frame = new JFrame();
	Object[] possibilities = {"Bianary Search Tree", "Double Linked List", "Graph", "Heap"};
	String s = (String)JOptionPane.showInputDialog(frame,"Choose a data structure!:\n", "Structure Selector",
						       JOptionPane.PLAIN_MESSAGE, null, possibilities,"select one...");

	if ((s == "Bianary Search Tree") && (s.length() > 0)) {
	        try {
		String line;
		Process p = Runtime.getRuntime().exec("./BST/application.linux32/BST");
		p.waitFor();
		System.out.println(p.exitValue());
	    }
	    catch (Exception err) {
		err.printStackTrace();
	    }
	    return;
	}
	if ((s == "Double Linked List") && (s.length() > 0)) {
	    	    try {
		String line;
		Process p = Runtime.getRuntime().exec("./DLL/application.linux32/DLL");
		p.waitFor();
		System.out.println(p.exitValue());
	    }
	    catch (Exception err) {
		err.printStackTrace();
	    }
	    return;
	   
	}
	if ((s == "Graph") && (s.length() > 0)) {
	    try {
		String line;
		Process p = Runtime.getRuntime().exec("./Graph/application.linux32/Graph");
		p.waitFor();
		System.out.println(p.exitValue());
	    }
	    catch (Exception err) {
		err.printStackTrace();
	    }
	    return;
	}
	if ((s == "Heap") && (s.length() > 0)) {
	    try {
		String line;
		Process p = Runtime.getRuntime().exec("./Heap/HV/application.linux32/HV");
		p.waitFor();
		System.out.println(p.exitValue());
	    }
	    catch (Exception err) {
		err.printStackTrace();
	    }
	    return;
	} else {return;}
    
	

    }
}

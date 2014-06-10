import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.util.*;

public class MacStructureSelector {


    public static void main (String[] args){  
	JFrame frame = new JFrame();
	Object[] possibilities = {"Binary Search Tree", "Double Linked List", "Graph", "Heap"};
	String s = (String)JOptionPane.showInputDialog(frame,"Choose a data structure!:\n", "Structure Selector",
						       JOptionPane.PLAIN_MESSAGE, null, possibilities,"select one...");

	if ((s == "Binary Search Tree") && (s.length() > 0)) {
	        try {
		String line;
		Process p = Runtime.getRuntime().exec("open ./BST/application.macosx/BST.app");
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
		Process p = Runtime.getRuntime().exec("open ./DLL/application.macosx/DLL.app");
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
		Process p = Runtime.getRuntime().exec("open ./Graph/application.macosx/Graph.app");
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
		Process p = Runtime.getRuntime().exec("open ./HV/application.macosx/HV.app");
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

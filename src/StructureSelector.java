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

	//If a string was returned, say so.
	if ((s == "Binary Search Tree") && (s.length() > 0)) {
	    /*DO SOMETHING*/
	    return;
	}
	if ((s == "Double Linked List") && (s.length() > 0)) {
	    /*DO SOMETHING*/
	    return;
	}
	if ((s == "Graph") && (s.length() > 0)) {
	    /*DO SOMETHING*/
	    return;
	}
	if ((s == "Heap") && (s.length() > 0)) {
	    /*DO SOMETHING*/
	    return;
	} else {return;}
    
	

    }
}

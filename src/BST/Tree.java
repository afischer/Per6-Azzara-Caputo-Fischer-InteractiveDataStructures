

public class Tree{
    private class Leaf{
	int data;
	Leaf leftLeaf, rightLeaf;
	public Leaf(int d){
	    this.data = d;
	    leftLeaf = null;
	    rightLeaf = null;
	}
	public String toString(){return ""+data;}
	public void setData(int d){data = d;}
	public int getData(){return data;}
	public void setLeft(Leaf l) {leftLeaf = l;}
	public void setRight(Leaf r) {rightLeaf = r;}
	public Leaf getLeft(){return leftLeaf;}
	public Leaf getRight(){return rightLeaf;}
    }
    private Leaf root;

    public Tree(){
	root = null;
    }

    public boolean insert(int d){
	Leaf x = new Leaf(d);
	if(root == null){
	    root = x;
	    return true;
	}
	boolean inPlace = false;
	Leaf current = root;
	while(!inPlace){
	    int i = current.getData();
	    if(d<i){
		if(current.getLeft()==null){
		    current.setLeft(x);
		    inPlace = true;
		}else{
		    current = current.getLeft();
		}
	    }else if(d>i){
		if(current.getRight()==null){
		    current.setRight(x);
		    inPlace = true;
		}else{
		    current = current.getRight();
		}
	    }else{
		break;
	    }
	}
	return inPlace;
    }

    public String toString(){
        return toString(root);
    }

    public String toString(Leaf r){
	String result = "";
	if (r == null ||( r.getLeft()==null && r.getRight()==null)){
	    return "";
	}
	else{
	    result += (r.getLeft()!=null ? r.getLeft().getData()+"<" : "")+r.getData()+(r.getRight()!=null ? ">"+r.getRight().getData() : "")+"\n";
	    result+=toString(r.getLeft());
	    result+=toString(r.getRight());
	}
	return result;
    }


    public Leaf find(int target){
	Leaf current = root;               
	while(current.getData() != target)        
	    {
		if(target < current.getData()){         
		    current = current.getLeft();
		}
		else{                          
		    current = current.getRight();
		}
		if(current == null){            
		    return null;     
		}
	    }
	return current;                   	
    }

    public static void main(String[] args){
	Tree t = new Tree();
	t.insert(7);
	System.out.println(t);
	t.insert(5);
	System.out.println(t);
	t.insert(6);
	System.out.println(t);
	t.insert(4);
	System.out.println(t);
	t.insert(3);
	System.out.println(t);
	t.insert(9);
	System.out.println(t);
	t.insert(8);
	System.out.println(t);
	t.insert(10);
	System.out.println(t);
    }
}


   

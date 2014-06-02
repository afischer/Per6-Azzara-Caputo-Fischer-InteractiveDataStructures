	private class heap{
		private int[]h = new int[10];
		
		private heap(){ 
			h[0] = 0;
		}

		public int getSize(){ return h[0]; }
		
		public int getMax(){ return h[1]; }

		public void resize(){
			if (h[0] > h.length / 2){
				int[] newList = new int[(int)((double)h.length * 1.75)];
				for (int i = 0; i < h[0]; i++){
					newList[i] = h[i];
				}
				h = newList;
			}else if((h.length > 30) && (h[0] < h.length / 4)){
				int[] newList = new int[(int)((double)h.length * .75)];
				for (int i = 0; i < h[0]; i++){
					newList[i] = h[i];
				}
				h = newList;
			}
		}
		
		public void add(int value){
			int i = h[0];
			h[0]++;
			i++;
			h[i] = value;
			pushUp(i);
			resize();
		}
		
		public void pushUp(int index){
			if (index < 2){
				//do nothing
			}else if (index == 2){
				if (h[2] > h[1]){
					int temp = h[2];
					h[2] = h[1];
					h[1] = temp;
				}
			}else if (h[index] > h[index/2]){
				int temp = h[index];
				h[index] = h[index/2];
				h[index/2] = temp;
				pushUp(index/2);
			}
		}
		
		public int remove(){
			int f = h[1];
			if (h[2] > h[3]){
				h[1] = h[2];
				h[2] = Integer.MIN_VALUE;
				removeH(2);
			}else if (h[2] < h[3]){
				h[1] = h[3];
				h[3] = Integer.MIN_VALUE;
				removeH(3);
				}
			h[0]--;
			return f;
		}	
		
		public void removeH(int index){
			try{
				if (h[index*2] > h[index*2 + 1]){
					h[index] = h[index*2];
					h[index*2] = Integer.MIN_VALUE;
					removeH(index*2);
				}else if (h[index*2] < h[index*2 + 1]){
					h[index] = h[index*2 + 1];
					h[index*2] = Integer.MIN_VALUE;
					removeH(index*2 + 1);
				}
			}catch(ArrayIndexOutOfBoundsException E){
			}
		}
		
		public String toString(){
			String f = "heap: [";
			for (int i = 0; i < h[0]; i++){
				f+= h[i] + ", ";
			}
			f+= h[h[0]]+"]";
			return f;
		}
	}
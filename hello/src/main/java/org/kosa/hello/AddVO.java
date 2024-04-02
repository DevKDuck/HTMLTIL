package org.kosa.hello;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AddVO {
	private int a;
	private int b;
	private int result; 
	
	public void calc() {
		result = a + b;
	}
}

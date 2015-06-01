package cn.gx.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Iterator;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.model.FieldsDocumentPart;
import org.apache.poi.hwpf.usermodel.Field;
import org.apache.poi.hwpf.usermodel.Fields;

public class TestPoi {

	/**
	 * 
	 * @param args
	 */

	public static void main(String[] args) {
		//��ȡwordģ��
		try {
			FileInputStream in = new FileInputStream(new File("D://template.doc"));
			HWPFDocument hdt = new HWPFDocument(in);
			Fields fields = hdt.getFields();
			Iterator<Field> it = fields.getFields(FieldsDocumentPart.MAIN).iterator();
			while(it.hasNext()){
				 System.out.println(it.next().getType());
				}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//��ȡword�ı�����
//		Range range = hdt.getRange();
//		System.out.println(range.text());
//		//�滻�ı�����
//		for (Map.Entry<String,String> entry:map.entrySet()) {
//		 range.replaceText(entry.getKey(),entry.getValue());
//		}
//		ByteArrayOutputStream ostream = new ByteArrayOutputStream();
//		String fileName = ""+System.currentTimeMillis();
//		fileName += ".doc";
//		FileOutputStream out = new FileOutputStream(fileDir+"/"+fileName,true);
//		hdt.write(ostream);
//		//����ֽ���
//		out.write(ostream.toByteArray());
//		out.close();
//		ostream.close();

	}

}
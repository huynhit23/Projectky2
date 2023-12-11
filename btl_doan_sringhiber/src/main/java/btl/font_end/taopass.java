package btl.font_end;

import org.mindrot.jbcrypt.BCrypt;

public class taopass {
	
		public static void main(String[] args) {
//			System.out.println(BCrypt.hashpw("123456", BCrypt.gensalt(12)));
			System.out.println(BCrypt.checkpw("123456", "$2a$12$bNjM5EhLIXq.ocFErtoZk.XszY60vrEa0Nf3B.pnzqQJaOraZVtnq"));
		}
}

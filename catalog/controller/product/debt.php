<?php
class ControllerProductDebt extends Controller {

	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));
		
		$data['getDebt'] = $this->url->link('product/debt');
		$data['success'] = $this->url->link('product/debt/back','result=success');
		$data['fail'] = $this->url->link('product/debt/back','result=fail');
		$data['orderId'] = time();

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/debt.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/debt.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/product/debt.tpl', $data));
		}
		
	}
	public function getPayment() {
		$json = array();
		if(!empty($_GET['order']) && !empty($_POST['amount'])) {
		    $headers = array(
		        'Accept: text/json',
		        'Authorization: Basic '.base64_encode('ND6M7GGEIK:ae3df5jLeQ2s45gh'),
		        'Content-Type: application/x-www-form-urlencoded; charset=utf-8',
		    );
		    $comment = $_POST['comment'];
		    $url = '/api/prv/1194942/bills/'.$_GET['order'];
		    $user = 'tel:'.$_POST['user'];
		
		    $sum = number_format($_POST['amount'],2,'.','');
		    $rawdata = array(
		        'user'=>$user,
		        'amount'=>$sum,
		        'ccy'=>'RUB',
		        'comment'=>$comment,
		        'lifetime'=>date('Y-m-d\TH:i:s',strtotime('+24 hour'))
		
		    );
		    $data_req = '';
		    foreach ($rawdata as $key => $param) {
		      $data_req .= "$key=".urlencode($param)."&";
		    }
		    $result = $this->request($url, '='.urlencode($data_req), $headers);
		    if( strpos($result, "<h2>401")!==FALSE) {
		      $result = json_encode(array('response'=>array('result_code'=>99999)));
		    }
		    $result = json_decode($result);
		    if($result) {
		      if ($result->response->result_code==0 || $result->response->result_code==215){
		      	$json['result'] = 'OK';
		      } else {
		      	$json['result'] = 'ERROR';
		      }
		    } else {
		      $json['result'] = 'ERROR';
		    }
		} else {
	      $json['result'] = 'ERROR';
	    }
	    $this->response->setOutput(json_encode($json));
	}
	public function back() {
		if($_GET['result'] == 'success'){
			header("Content-Type: text/xml");
			echo "<?xml version=\"1.0\"?><result><result_code>0</result_code></result>";
			
			$to = 'alex_z@timespeak.ru';
			//$to2 = '';
			$subject = 'Новый платеж!';
			$message .= 'Сумма:' . $_POST['amount'];
			$headers = 'From:  alex_z@timespeak.ru' . "\r\n" . 'Reply-To: ' . $to .  "\r\n" .'X-Mailer: Adobe Muse 7.2.232 with PHP/' . phpversion() . "\r\n" . 'Content-type: text/html; charset=utf-8' . "\r\n";
			$sent = mail($to, $subject, $message, $headers);
			$file = 'mails.txt';
			
			$message = "\r\n---\r\n";
			$message .= date('H:i:s d.m.Y')."\r\n";
			$message .= var_export($_REQUEST, true);
			$message .= "---\r\n";
			file_put_contents($file, $message, FILE_APPEND | LOCK_EX);
		}
	}
	public function getDebt() {
		$json = array();
		$data_string = '{"command":"getclientinfo", "value":{"clientdocs":"' . $_POST['clientdocs'] .'","clientdocn":"' . $_POST['clientdocn'] .'"},"check":"2fd06c4c24be4f760143a5346409794e"}';
	
		$ch = curl_init('83.234.69.30:5544');
		curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
		curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_HTTPHEADER, array(
			'Content-Type: application/json',
			'Content-Length: ' . strlen($data_string))
		);
	
		$result = json_decode(curl_exec($ch));
	
		if (!isset($result->errorcode)) {
			(string) $name_post = preg_replace('/\s/', '', mb_strtolower(implode(' ', $_POST['clientname'])));
			(string) $name_res = preg_replace('/\s/', '', mb_strtolower($result->sname.$result->fname.$result->mname));
	
			if ($name_post == $name_res) {
				$data_string = '{"command":"getorders", "value":{"clientid":"' . $result->id . '"},"check":"abcfd3c11f15595eca142a4818facc09"}';
	
				$ch = curl_init('83.234.69.30:5544');
				curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
				curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
				curl_setopt($ch, CURLOPT_HTTPHEADER, array(
					'Content-Type: application/json',
					'Content-Length: ' . strlen($data_string))
				);
	
				$result = json_decode(curl_exec($ch));
				if (!isset($result->errorcode)) {
					foreach ($result->orderList as $o) {
						$data_string = '{"command":"getorderstatus", "value":{"ordernumber":"' . $o->number . '"},"check":"abcfd3c11f15595eca142a4818facc09"}';
	
						$ch = curl_init('83.234.69.30:5544');
						curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
						curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
						curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
						curl_setopt($ch, CURLOPT_HTTPHEADER, array(
							'Content-Type: application/json',
							'Content-Length: ' . strlen($data_string))
						);
	
						$result = json_decode(curl_exec($ch));
						if (!isset($result->errorcode)) {
							$json[] = $result;
						}
					}
				} else {
					$json['error'] = 'Заявки в базе данных отсутствуют!';
				}
			} else {
				$json['error'] = 'Неверно указаны данные!';
			}
		} else {
			$json['error'] = 'Данные не найдены в базе, проверьте правильность.';//'К сожалению сервис временно недоступен!',
		}
		$this->response->setOutput(json_encode($json));
	}
	private function request($url,$data,$headers=array(), $method = 'PUT') {
	  //$data = http_build_query($data);
	  //$url = parse_url($url);
	  $head = '';
	  if (!empty($headers)){
	    foreach($headers as $param=>$value){
	      $head .= "{$value}\r\n";
	    }
	  }
	
	    $fp = @fsockopen("ssl://shop.comepay.ru", 443, $errno, $errstr, 10);
	    $host = 'shop.comepay.ru';
	
	  $result = '';
	  if (!$fp) {
	    //echo "$errstr ($errno)<br />\n";
	    return false;
	  } else {
	    $out = $method." {$url} HTTP/1.0\r\n";
	    $out .= "Host: {$host}\r\n";
	    $out .= $head;
	    //$out .= "Content-type: application/x-www-form-urlencoded\r\n";
	    if($data){
	      $out .='Content-Length: ' . strlen($data)."\r\n";
	    }
	    $out .= "Connection: Close\r\n\r\n";
	    $out .= $data;
	    fwrite($fp, $out);
	    $headers = "";
	    while(!feof($fp))
	    {
	      $line = fgets($fp, 4096);
	      if($line == "\r\n")
	      {
	        break;
	      }
	      $headers .= $line;
	    }
	
	    while(!feof($fp))
	      $result .= fread($fp, 4096);
	
	    fclose($fp);
	  }
	  return $result;
	}
}
